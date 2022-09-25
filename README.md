# FIFO
Every memory in which the data word that is written in first also comes out first when the memory is read is called a first-in first-out
memory. It is basically used in electronics circuits for buffering and flow control and synchronization which is from hardware to software. It  is a read/write memory array that keeps track of the data arrival order and preserves it when  data is read.<br>
    If the data read/write on the same clock the FIFO is synchronous. In a synchronous FIFO the same clock is used for both reading and writing. There are some FIFO flags like buf_empty and buf_full. For synchronisation purpose we use Hardware FIFO. It is often implemented as a circular queue. It has two pointers: Read pointer and write pointer. When the read pointer is equal to the write pointer,the FIFO is termed as EMPTY. When the difference between the read pointer and write pointer is equal with the size of queue ,then FIFO is termed as FULL. <br>
  
![FIFO_page-0001](https://user-images.githubusercontent.com/111141190/192133923-3c41e4c0-fd33-440c-95a6-20b1e79b31b1.jpg)
