package com.consdata.task.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.time.Instant;

@NoArgsConstructor
@Data
@Table(name = "TASKS")
@Entity
public class Task implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String chapter;

    @Column
    private String title;

    @Column
    private String description;

    @Column(name = "CREATION_DATE", nullable = false, updatable = false)
    private Instant creationDate = Instant.now();
}
