El Completely Fair Scheduler (CFS) es el planificador de procesos utilizado por defecto en el kernel de Linux desde la versión 2.6.23, reemplazando al anterior O(1) scheduler. Desarrollado principalmente por Ingo Molnar, el CFS se centra en maximizar la equidad en la distribución del tiempo de CPU entre los procesos, buscando ofrecer un rendimiento óptimo y predecible. Aquí describo sus características principales y su funcionamiento:

### **Características principales del CFS:**

1. **Basado en el tiempo de ejecución**: A diferencia de los planificadores tradicionales que se basan en prioridades fijas, CFS utiliza el tiempo de ejecución de los procesos para tomar decisiones de planificación, buscando que todos los procesos reciban una porción equitativa del tiempo de CPU.
2. **Red-Black Tree**: CFS utiliza un árbol de tipo red-black para gestionar los procesos. Cada nodo del árbol representa un proceso, y el árbol se organiza en función del tiempo de ejecución virtual de cada proceso, lo que permite una inserción, eliminación y búsqueda de procesos en tiempo logarítmico.
3. **Virtual Runtime (vruntime)**: Es el tiempo de ejecución virtual de un proceso. CFS calcula el vruntime de un proceso basándose en su tiempo real de ejecución ajustado por su peso (que está relacionado con su prioridad nice). Los procesos con menor vruntime son los que obtienen primero el acceso al CPU.
4. **Slices de tiempo**: CFS reparte el tiempo de CPU en "slices" (rebanadas), asignando a cada proceso un slice de tiempo para ejecutarse antes de pasar al siguiente proceso. El tamaño del slice se calcula en función de la prioridad nice del proceso y el número total de procesos en ejecución.
5. **Equidad**: El objetivo principal del CFS es asegurar que todos los procesos reciban una cantidad de tiempo de CPU proporcional a su peso, lo que garantiza un comportamiento justo y evita el hambre (starvation) de procesos.

### **Funcionamiento del CFS:**

1. **Selección de procesos**: CFS selecciona el proceso con el menor vruntime para ejecutar a continuación, garantizando que el proceso que ha utilizado menos la CPU tiene la mayor prioridad para ser seleccionado.
2. **Actualización de vruntime**: Cuando un proceso se ejecuta, su vruntime se incrementa en función del tiempo que ha pasado en la CPU. Esto asegura que otros procesos tengan la oportunidad de ser ejecutados, manteniendo la equidad.
3. **Desalojo (Preemption)**: Si un nuevo proceso entra en el sistema con un vruntime menor que el proceso actualmente en ejecución, el CFS puede desalojar el proceso actual para garantizar que el nuevo proceso se ejecute, manteniendo así la equidad en el tiempo de ejecución.
4. **Balanceo de carga**: CFS también trabaja en conjunto con el mecanismo de balanceo de carga del kernel de Linux, que redistribuye los procesos entre los diferentes CPUs en un sistema multicore para asegurar un uso eficiente de los recursos.