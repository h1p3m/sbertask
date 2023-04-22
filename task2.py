import random
 
#quicksort sort and find kth largest element
def kthSmallest(arr, l, r, K, n):
 
    # If k is smaller than number of
    # elements in array
    if (K > 0 and K <= r - l + 1):
 
 
        pos = partition(arr, l, r)
 
        # If position is same as k
        if (pos - l == K - 1):
            return
        if (pos - l > K - 1):  # If position is more,
                              # recur for left subarray
            return kthSmallest(arr, l, pos - 1, K, n)
 
        # Else recur for right subarray
        return kthSmallest(arr, pos + 1, r,
                           K - pos + l - 1, n)
 
  
    print("Invalid value of K")
 
 
def KthLargest(arr, l, r, K, N):

 
    kthSmallest(arr, l, r, N - K - 1, N)
 
 
# standart quick sort partition
 
def partition(arr, l, r):
 
    x = arr[r]
    i = l
    for j in range(l, r):
        if (arr[j] <= x):
            arr[i], arr[j] = arr[j], arr[i]
            i += 1
    arr[i], arr[r] = arr[r], arr[i]
    return i
 
 

a =  [100, 180, 50, 60, 150]
n = len(a)
 
low = 0
high = n - 1
 

k = 3
 
#  For Largest
KthLargest(a, 0, n-1, k, n)


#insert into array half of the each k largest elements
for i in range(n - 1, n-k-1, -1):
    a.insert(int(n/2),a[i])
    a.pop(i)




 

#  swap largest to half of the nominals
if (k >= 1 and k <= n):
    
    for i in range(n - 1, n-k-1, -1):
        a[i]=a[i]/2
        #insert again
        a.insert(i,a[i])
    
        

print(a)
 
