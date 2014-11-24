using UnityEngine;
using System.Collections;

public class PersonController : MonoBehaviour
{
	[SerializeField]
	float _moveSpeed = 5f;

	[SerializeField]
	float _angularSpeed = 70f;

	void Update()
	{
		if(Input.GetKey(KeyCode.W))
		{
			transform.position += transform.forward * _moveSpeed *Time.deltaTime;
		}
		if(Input.GetKey(KeyCode.S))
		{
			transform.position += -transform.forward * _moveSpeed *Time.deltaTime;
		}
		if(Input.GetKey(KeyCode.A))
		{
			Quaternion deltaRotation = Quaternion.AngleAxis(-_angularSpeed * Time.deltaTime, Vector3.up);
			Quaternion nextQuat = transform.rotation * deltaRotation;
			transform.rotation = nextQuat;

			transform.rotation = nextQuat;
		}
		if(Input.GetKey(KeyCode.D))
		{
			Quaternion deltaRotation = Quaternion.AngleAxis(_angularSpeed * Time.deltaTime, Vector3.up);
			Quaternion nextQuat = transform.rotation * deltaRotation;
			transform.rotation = nextQuat;
			
			transform.rotation = nextQuat;
		}
	}
}
