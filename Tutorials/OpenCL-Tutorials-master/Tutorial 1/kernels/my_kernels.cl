//a simple OpenCL kernel which adds two vectors A and B together into a third vector C
kernel void add(global const int* A, global const int* B, global int* C) {
	int id = get_global_id(0);
	C[id] = A[id] + B[id];
}

//a simple smoothing kernel averaging values in a local window (radius 1)
kernel void avg_filter(global const float* A, global float* B, global float* C) {
	int id = get_global_id(0);
	B[id] = (A[id] + A[id] + A[id])/3;		 
}

//a simple 2D kernel
kernel void add2D(global const int* A, global const int* B, global int* C) {
	int x = get_global_id(0);
	int y = get_global_id(1);
	int width = get_global_size(0);
	int height = get_global_size(1);
	int id = x + y*width;

	printf("id = %d x = %d y = %d w = %d h = %d\n", id, x, y, width, height);

	C[id]= A[id]+ B[id];
}

kernel void multiadd(global const int* A, global const int* B, global int* C) {
	int id = get_global_id(0);
	C[id] = A[id] * B[id] + B[id];
}

kernel void addf(global const float* A, global float* B) {
	int id = get_global_id(0);
	B[id] =  (A[id] + A[id] + A[id]) / 3;
	//printf("Work item id = %d\n", id);
	//if (id == 0) {
	//	printf("Work group size %d\n", get_local_size(0));
	//}
	//int loc_id = get_local_id(0);
	//printf("global id = %d, local id = %d\n", id, loc_id);
}


	kernel void OLDaddf(global const float* A, global float* B, global float* C) {
		int id = get_global_id(0);
		C[id] = A[id] * B[id];
		printf("Work item id = %d\n", id);
		if (id == 0) {
			printf("Work group size %d\n", get_local_size(0));
		}
		int loc_id = get_local_id(0);
		printf("global id = %d, local id = %d\n", id, loc_id);
	}


