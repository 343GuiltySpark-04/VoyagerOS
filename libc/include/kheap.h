#ifndef KHEAP_H
#define KHEAP_H

#include <common.h>

typedef struct _KHEAPBLOCKBM
{
    struct _KHEAPBLOCKBM *next;
    u32int size;
    u32int used;
    u32int bsize;
    u32int lfb;
    uintptr data;
    u8int *bm;
} KHEAPBLOCKBM;

typedef struct _KHEAPBM
{
    KHEAPBLOCKBM *fblock;
} KHEAPBM;

void k_heapBMInit(KHEAPBM *heap);
int k_heapBMAddBlock(KHEAPBM *heap, uintptr addr, u32int size, u32int bsize);
int k_heapBMAddBlockEx(KHEAPBM *heap, uintptr addr, u32int size, u32int bsize, KHEAPBLOCKBM *b, u8int *bm, u8int isBMInside);
void *k_heapBMAlloc(KHEAPBM *heap, u32int size);
void k_heapBMFree(KHEAPBM *heap, void *ptr);
uintptr k_heapBMGetBMSize(uintptr size, u32int bsize);
void *k_heapBMAllocBound(KHEAPBM *heap, u32int size, u32int mask);
void k_heapBMSet(KHEAPBM *heap, uintptr ptr, uintptr size, u8int rval);

#endif
