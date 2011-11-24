Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTUf5-0006Yu-L2
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 03:28:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lizhihui95221@gmail.com>) id 1RTUf2-0006ND-7a
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 03:28:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lizhihui95221@gmail.com>) id 1RTUey-0006JA-B9
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 03:28:00 -0500
Received: from mail-yw0-f45.google.com ([209.85.213.45]:59484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lizhihui95221@gmail.com>)
	id 1RTUev-0006Ij-Kk; Thu, 24 Nov 2011 03:27:53 -0500
Received: by ywf7 with SMTP id 7so2652224ywf.4
	for <multiple recipients>; Thu, 24 Nov 2011 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type;
	bh=ajp9rBhGgUaJfUXQIJqp6k8LqSAW4V7XUYwNKdzI08M=;
	b=OQmWfJyhfSxxMT63KidwgtXwSxbUO+ddA1DMubYQFQY4oKcvCg0uf2Id5WhEFpHPry
	910Bp099oF1YY84pcFA764mqYnxV5UhQhfwXOw99+uYIcMGBxHQL1z3yEDjSon7elAfO
	thrvhoFyVMJnrSNIZYwj+PcTLvT5lXTExlMDY=
MIME-Version: 1.0
Received: by 10.68.38.68 with SMTP id e4mr15408074pbk.126.1322123272634; Thu,
	24 Nov 2011 00:27:52 -0800 (PST)
Sender: lizhihui95221@gmail.com
Received: by 10.142.242.3 with HTTP; Thu, 24 Nov 2011 00:27:52 -0800 (PST)
Date: Thu, 24 Nov 2011 16:27:52 +0800
X-Google-Sender-Auth: t-vYyGIjYHsLm7fnW3uu-hu2p3k
Message-ID: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>
From: Zhi Hui Li <zhihuili@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=bcaec52161cf03c0cf04b276d04b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] os-win32.c : fix memory leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 08:28:01 -0000

--bcaec52161cf03c0cf04b276d04b
Content-Type: text/plain; charset=ISO-8859-1

string is allocated by g_malloc, will not be used after putenv, should be
free before return.

Signed-off-by: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
---
 os-win32.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/os-win32.c b/os-win32.c
index 8ad5fa1..e6e9143 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -44,6 +44,7 @@ int setenv(const char *name, const char *value, int
overwrite)
         char *string = g_malloc(length);
         snprintf(string, length, "%s=%s", name, value);
         result = putenv(string);
+        g_free(string);
     }
     return result;
 }
-- 
1.7.4.1

--bcaec52161cf03c0cf04b276d04b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

string is allocated by g_malloc, will not be used after putenv, should be f=
ree before return.<br><br>Signed-off-by: Li Zhi Hui &lt;<a href=3D"mailto:z=
hihuili@linux.vnet.ibm.com">zhihuili@linux.vnet.ibm.com</a>&gt;<br>---<br>
=A0os-win32.c |=A0=A0=A0 1 +<br>=A01 files changed, 1 insertions(+), 0 dele=
tions(-)<br><br>diff --git a/os-win32.c b/os-win32.c<br>index 8ad5fa1..e6e9=
143 100644<br>--- a/os-win32.c<br>+++ b/os-win32.c<br>@@ -44,6 +44,7 @@ int=
 setenv(const char *name, const char *value, int overwrite)<br>
=A0=A0=A0=A0=A0=A0=A0=A0 char *string =3D g_malloc(length);<br>=A0=A0=A0=A0=
=A0=A0=A0=A0 snprintf(string, length, &quot;%s=3D%s&quot;, name, value);<br=
>=A0=A0=A0=A0=A0=A0=A0=A0 result =3D putenv(string);<br>+=A0=A0=A0=A0=A0=A0=
=A0 g_free(string);<br>=A0=A0=A0=A0 }<br>=A0=A0=A0=A0 return result;<br>=A0=
}<br>-- <br>
1.7.4.1<br><br><br>

--bcaec52161cf03c0cf04b276d04b--

