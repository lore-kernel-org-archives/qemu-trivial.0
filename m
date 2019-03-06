Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPj-0005O4-3H
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPf-0005KV-Ho
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPZ-0002Ql-KO
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:35 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34575)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UPU-0002Kh-T6; Wed, 06 Mar 2019 06:08:29 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MYNW8-1gWC7j0UWw-00VQsB; Wed, 06 Mar 2019 12:07:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Zhang Chen <zhangckid@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-s390x@nongnu.org, Corey Minyard <minyard@acm.org>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Wed,  6 Mar 2019 12:07:10 +0100
Message-Id: <20190306110711.309-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EIQ2MrmTkDMjQDlxKKFoQHKCip2VxS79yw3nG/bZ7V1n5Rr+kLE
	HTEMToeoh2ik437K2rRTUXpWRZMoMPU5Iww1wszPUi2/lZLJI9rcv8v6VOuK0JC0q5ozGOz
	f/o3RI9aruUlmKK4zxMCa17jwGNUGLkxdDD1mJPXM/y0IvvcB1fCOmVwZNHdvEX3NeeRWmT
	414lPK51Mi7sruoUoY7bA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8SWa3ZNamPQ=:rc0koxLwhQkQA8WoouhueW
	IseJO9a4QVonALTfNzYmNkrW7BiSMKrlOhp17GI197eUEz/sI4pFnlO+l6T8LhLUZUvAxQX9u
	9kaOAX1E23iIsAImBwSBwCtXrrtcFlxp7UvuydGAMFI00/AreFcW8r7DPRnzg0EYYfBFhGIIN
	3Gg4I9gfNETKF7AqF8cfYDvCEcufFDRijudLU3w1loaG6NNxp/od8JSHGtaSuycc5AxXcYWJ8
	o6Hk/PG3jIjjr7quHJslvianQjewrD6EQmdYCGWSzGxAC0HoTlHFxpYKzppTyBHsUQx+zaf0w
	gd3PaQhvYb7uIXASbcnS+WyzTgfZH8WBgM1U/KQ9AU1eYAs+NdDLRMPsYdgOwCtpyEfmvL2Oy
	imku7StHcguVt7ZaQFuvZTSfzjRJ1tPqXX6I18mnz9+zgCY+Tzkn35Puw2U3nXn/dEmIuOTG2
	XnaB7cmqpUMoK7gp7e8xQrIdfAuuXnWujq1sEp7qc9qhC9uI/ftJKSAKIyyUWMUxtzoyOVJq8
	bS+/NtIJkKbARdEHzH/OSxmjAs/lGK+Pah9vk0uflUDaD0KoK5AxlvhbpF5GZOiBZgxJ2xdAs
	BQAaY6Qlx+8z2L8KpgrgaFr3J1mA7pgEFvP18NNykHlNms5iphiu19Y9DFkPT9mBvtNefiqqg
	e7eZAxGvsg8hntb+lVoMC6te5NsKXmTWMwMIycKgP8738UWVLfYJ0bF42j2mVar1Gt7istfwC
	9oCUmpMchm1lJvsDjzxIDSnrOW8+mgT81HrO1Q==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL 09/10] hostmem-file: simplify ifdef-s in
 file_backend_memory_alloc()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 11:08:40 -0000

From: Igor Mammedov <imammedo@redhat.com>

cleanup file_backend_memory_alloc() by using one CONFIG_POSIX ifdef
instead of several ones within the function to make it simpler to follow.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190213123858.24620-1-imammedo@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20190214031004.32522-2-stefanha@redhat.com>
[lv: s/hostmem/hostmem-file/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 backends/hostmem-file.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index ba601ce94088..ce5478804804 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -41,10 +41,12 @@ struct HostMemoryBackendFile {
 static void
 file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
+#ifndef CONFIG_POSIX
+    error_setg(errp, "backend '%s' not supported on this host",
+               object_get_typename(OBJECT(backend)));
+#else
     HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
-#ifdef CONFIG_POSIX
     gchar *name;
-#endif
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
@@ -54,9 +56,6 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
         error_setg(errp, "mem-path property not set");
         return;
     }
-#ifndef CONFIG_POSIX
-    error_setg(errp, "-mem-path not supported on this host");
-#else
     backend->force_prealloc = mem_prealloc;
     name = host_memory_backend_get_name(backend);
     memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
-- 
2.20.1


