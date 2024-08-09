#!/bin/bash

# Função para obter os PIDs dos containers Docker
get_all_container_pids() {
  container_ids=$(docker ps -q)

  if [ -z "$container_ids" ]; then
    echo "Nenhum container em execução."
    exit 1
  fi

  all_pids=""

  for container_id in $container_ids; do
    # Obter o PID do processo principal do container
    container_pid=$(docker inspect --format '{{.State.Pid}}' $container_id)

    if [ -n "$container_pid" ]; then
      # Adicionar o PID principal do container à lista
      all_pids+="$container_pid "
      
      # Obter todos os processos que pertencem ao PID do container (usando cgroup)
      # Adicionar processos filhos do PID principal
      pids=$(ps --ppid $container_pid -o pid=)
      if [ -n "$pids" ]; then
        all_pids+="$pids "
      else
        echo "Nenhum processo encontrado para o container $container_id"
      fi
    else
      echo "PID do container não encontrado para $container_id"
    fi
  done

  # Verificar se a lista de PIDs está vazia
  if [ -z "$all_pids" ]; then
    echo "Nenhum PID encontrado para os containers."
    exit 1
  fi

  # Remover duplicatas e formatar os PIDs para o `htop`
  unique_pids=$(echo "$all_pids" | tr ' ' '\n' | sort -u | tr '\n' ',' | sed 's/,$//')

  # Executar `htop` com os PIDs filtrados
  if [ -n "$unique_pids" ]; then
    echo "Iniciando htop com filtros de PIDs: $unique_pids"
    htop -p $unique_pids
  else
    echo "Nenhum PID único encontrado."
    exit 1
  fi
}

# Executar a função
get_all_container_pids
