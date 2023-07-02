#input: 2 int arrays in non-decreasing order, 2 ints m and n representing # of elements
#goal: merge arrays in non-decr order
#output: merged m1 array
nums1 = [1,2,3,0,0,0]
m = 3
nums2 = [2,5,6]
n = 3

def merge_arrays(arr1, arr2, m, n)
  m_index = 0
  n_index = 0
  (m+n).times do
    pp arr1
    if arr1[m_index] && arr2[n_index]
      if arr1[m_index] > arr2[n_index]
        arr1.pop
        arr1.insert(m_index, arr2[n_index])
        m_index += 1
        n_index += 1
      elsif arr1[m_index] == 0
        arr1.pop
        arr1.insert(m_index, arr2[n_index])
        n_index += 1
        m_index += 1
      elsif arr1[m_index] <= arr2[n_index]
        m_index += 1
      end
    end
  end
end

merge_arrays(nums1, nums2, m, n)
pp nums1