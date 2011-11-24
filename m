Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTUaS-0004T7-N5
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 03:23:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lizhihui95221@gmail.com>) id 1RTUaP-0004I6-DW
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 03:23:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lizhihui95221@gmail.com>) id 1RTUaJ-0005ch-Pe
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 03:23:13 -0500
Received: from mail-gx0-f173.google.com ([209.85.161.173]:43298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lizhihui95221@gmail.com>)
	id 1RTUaE-0005cM-G8; Thu, 24 Nov 2011 03:23:02 -0500
Received: by ggnb1 with SMTP id b1so2682430ggn.4
	for <multiple recipients>; Thu, 24 Nov 2011 00:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type;
	bh=l2A8zo4DLuDOO97TBXD66nPwNZwCyBpTuMY5yBfDQBg=;
	b=Sdx3bdVZrZHGUETE7WwvbY3z5HfCqdd1XVEBDG8ny2cTpfpksmfNEp4x4/6LuegOn5
	cL9vt7h8ZZqzzmgebsTunXQigpsI0OA1r42QaoWFdhXGyrFqVFCCyrue3iXWiuQq0m5N
	8grL8g1VUHuywPSvrMxeuJZL/kwtxh51E132E=
MIME-Version: 1.0
Received: by 10.68.36.70 with SMTP id o6mr15755455pbj.109.1322122980950; Thu,
	24 Nov 2011 00:23:00 -0800 (PST)
Sender: lizhihui95221@gmail.com
Received: by 10.142.242.3 with HTTP; Thu, 24 Nov 2011 00:23:00 -0800 (PST)
Date: Thu, 24 Nov 2011 16:23:00 +0800
X-Google-Sender-Auth: _pjSfoeV24_OKq79_2KG3HK1mbY
Message-ID: <CAGtkxYxBfYxcVpQopgpkvf-POUf-uDEjjRht5sOye0REyFExAQ@mail.gmail.com>
From: Zhi Hui Li <zhihuili@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=bcaec51f96f1a103fc04b276be0f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] net/socket.c : fix memory leak
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
X-List-Received-Date: Thu, 24 Nov 2011 08:23:14 -0000

--bcaec51f96f1a103fc04b276be0f
Content-Type: text/plain; charset=ISO-8859-1

Signed-off-by: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
---
 net/socket.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index e9ef128..0f09164 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -409,6 +409,7 @@ static int net_socket_listen_init(VLANState *vlan,
     fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
     if (fd < 0) {
         perror("socket");
+        g_free(s);
         return -1;
     }
     socket_set_nonblock(fd);
@@ -420,11 +421,13 @@ static int net_socket_listen_init(VLANState *vlan,
     ret = bind(fd, (struct sockaddr *)&saddr, sizeof(saddr));
     if (ret < 0) {
         perror("bind");
+        g_free(s);
         return -1;
     }
     ret = listen(fd, 0);
     if (ret < 0) {
         perror("listen");
+        g_free(s);
         return -1;
     }
     s->vlan = vlan;
-- 
1.7.4.1

--bcaec51f96f1a103fc04b276be0f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Li Zhi Hui &lt;<a href=3D"mailto:zhihuili@linux.vnet.ibm.com=
">zhihuili@linux.vnet.ibm.com</a>&gt;<br>---<br>=A0net/socket.c |=A0=A0=A0 =
3 +++<br>=A01 files changed, 3 insertions(+), 0 deletions(-)<br><br>diff --=
git a/net/socket.c b/net/socket.c<br>
index e9ef128..0f09164 100644<br>--- a/net/socket.c<br>+++ b/net/socket.c<b=
r>@@ -409,6 +409,7 @@ static int net_socket_listen_init(VLANState *vlan,<br=
>=A0=A0=A0=A0 fd =3D qemu_socket(PF_INET, SOCK_STREAM, 0);<br>=A0=A0=A0=A0 =
if (fd &lt; 0) {<br>
=A0=A0=A0=A0=A0=A0=A0=A0 perror(&quot;socket&quot;);<br>+=A0=A0=A0=A0=A0=A0=
=A0 g_free(s);<br>=A0=A0=A0=A0=A0=A0=A0=A0 return -1;<br>=A0=A0=A0=A0 }<br>=
=A0=A0=A0=A0 socket_set_nonblock(fd);<br>@@ -420,11 +421,13 @@ static int n=
et_socket_listen_init(VLANState *vlan,<br>=A0=A0=A0=A0 ret =3D bind(fd, (st=
ruct sockaddr *)&amp;saddr, sizeof(saddr));<br>
=A0=A0=A0=A0 if (ret &lt; 0) {<br>=A0=A0=A0=A0=A0=A0=A0=A0 perror(&quot;bin=
d&quot;);<br>+=A0=A0=A0=A0=A0=A0=A0 g_free(s);<br>=A0=A0=A0=A0=A0=A0=A0=A0 =
return -1;<br>=A0=A0=A0=A0 }<br>=A0=A0=A0=A0 ret =3D listen(fd, 0);<br>=A0=
=A0=A0=A0 if (ret &lt; 0) {<br>=A0=A0=A0=A0=A0=A0=A0=A0 perror(&quot;listen=
&quot;);<br>+=A0=A0=A0=A0=A0=A0=A0 g_free(s);<br>
=A0=A0=A0=A0=A0=A0=A0=A0 return -1;<br>=A0=A0=A0=A0 }<br>=A0=A0=A0=A0 s-&gt=
;vlan =3D vlan;<br>-- <br>1.7.4.1<br><br><br>

--bcaec51f96f1a103fc04b276be0f--

