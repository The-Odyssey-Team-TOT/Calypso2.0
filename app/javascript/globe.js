import * as THREE from 'three';

function initGlobe() {
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(55, window.innerWidth / window.innerHeight, 0.1, 5);

  const renderer = new THREE.WebGLRenderer();
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.getElementById('globe-container').appendChild(renderer.domElement);

  const textureLoader = new THREE.TextureLoader();
  const texture = textureLoader.load('/assets/texture.jpg');

  const sphereGeometry = new THREE.SphereGeometry(1, 32, 32);
  const sphereMaterial = new THREE.MeshStandardMaterial({ map: texture });
  const sphere = new THREE.Mesh(sphereGeometry, sphereMaterial);
  scene.add(sphere);

  const light = new THREE.PointLight(0xffffff, 6, 100);
  light.position.set(10, 10, 10);
  scene.add(light);

  camera.position.z = 3;

  function animate() {
    requestAnimationFrame(animate);
    sphere.rotation.x += 0.00;
    sphere.rotation.y += 0.001;
    renderer.render(scene, camera);
  }

  animate();
}

document.addEventListener('DOMContentLoaded', initGlobe);

