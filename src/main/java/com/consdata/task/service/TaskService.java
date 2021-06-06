package com.consdata.task.service;

import com.consdata.task.model.Task;
import com.consdata.task.repository.TaskRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@RequiredArgsConstructor
@Service
public class TaskService {

    private final TaskRepository taskRepository;

    @PreAuthorize("hasRole('TASK')")
    public List<Task> getTasksWithoutAcl() {
        return taskRepository.findAll();
    }

    @PreAuthorize("hasRole('TASK')")
    @PostFilter("hasPermission(filterObject, 'READ')")
    public List<Task> getTasksWithAcl() {
        return taskRepository.findAll();
    }

    @PostAuthorize("hasPermission(returnObject, 'READ')")
    public Task getTaskById(Long id) {
        return taskRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Not found"));
    }
}
