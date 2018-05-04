Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fEfvg-0004qO-0o
	for mharc-qemu-trivial@gnu.org; Fri, 04 May 2018 14:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <johnnymarler@gmail.com>) id 1fEfaj-0005jk-4K
	for qemu-trivial@nongnu.org; Fri, 04 May 2018 14:38:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <johnnymarler@gmail.com>) id 1fEfai-0000Ks-88
	for qemu-trivial@nongnu.org; Fri, 04 May 2018 14:38:01 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:40406)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <johnnymarler@gmail.com>)
	id 1fEfaf-0000Ik-Up; Fri, 04 May 2018 14:37:58 -0400
Received: by mail-qt0-x244.google.com with SMTP id h2-v6so28626152qtp.7;
	Fri, 04 May 2018 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=iUuyLVfhV9Qes7ErBX5G74pzBEl52hOx2UARLAWfhWE=;
	b=s9gdXe8GMGX9xR0RTozIHUutxb7lL51XxOSEKwHJpy2Muga3BZcjZZEj8iuKMhRYbI
	Oo/VxoA2QnPiQw1WQA9qWhgSdwJTKvul98uoVprsWLpK1h13AqqeX8F1bVjSWR7GWjwZ
	vAmskc5z+oEYsYwlR92/1FAFjfFV6agL+VfWkKuDD9+WdD1j4IhA5UOz1KYO+LKqVmNV
	0fH9pf66BdEjdPltb89Vtg8dNsZHbYpLfDElK3+8nhVIPoGfrmY9NA2LT8MV1qyFrZb0
	xRhopm0KWUnxQFur6Gtaccun/AbNjZmhV2j3pUaUqFWDxFsPoTvtbg5J+4j1KHiXshkD
	XWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=iUuyLVfhV9Qes7ErBX5G74pzBEl52hOx2UARLAWfhWE=;
	b=UWylODYtPVog8bAY1cNJNoHD7MatTGvHOav9brSF8dzpjSsj4YeI+2Z2xcJYfUQy79
	rFhcVWcVSUVVZ8AXnGnxl1Vd9LZneHQ1hMkT+xkSbhqhVAYtC0z7xR+HzwZw6THqEmPV
	ck1cruYLIsCmZQ9EFvIPF2lY0Z12sHxvt8FwASKST3MTX49qQRcviKAnYIomK8aA4zTw
	JHn9O2DQaD6i1LLfOT3BbAh7Jnwkp+DT5b4W/wyHZwwXAYHwOTHkeIEdDVEtetWlHdAs
	aAHX4B90DsfLdAM/+agAFJ109u37s/L0z10y+EYyGp9e8aS3+T50uHoJNjuxaFRrzUWa
	eMZA==
X-Gm-Message-State: ALQs6tBDtD6eltv3YoHPsMAfpVLErpZ+c3l6ShYVIN6afAHJmA9UyPMT
	YyPSwij+ysNknVHoPny6b1kOiXiAfYBl7xb8OqI=
X-Google-Smtp-Source: AB8JxZoouXTZ8KDxh9wgG2feE/hm5Up0z0s0TupZE72UyFSI+vN4npwoU06z6XjRhGyQGcWQrL6joFMAbrqcMhRAMoU=
X-Received: by 2002:ac8:41e:: with SMTP id
	v30-v6mr26215042qtg.270.1525459077157; 
	Fri, 04 May 2018 11:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.5.77 with HTTP; Fri, 4 May 2018 11:37:56 -0700 (PDT)
From: Jonathan Marler <johnnymarler@gmail.com>
Date: Fri, 4 May 2018 12:37:56 -0600
Message-ID: <CACKT+Ap2MHCrSCT-0_=KG9UrGAtO7F3EGue6-63-XJxry9=C=w@mail.gmail.com>
To: crosthwaite.peter@gmail.com, agraf@suse.de, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000069d7c8056b659e06"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
X-Mailman-Approved-At: Fri, 04 May 2018 14:59:39 -0400
Subject: [Qemu-trivial] [PATCH] handle all fdt_get_phandle_errors
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
X-List-Received-Date: Fri, 04 May 2018 18:38:02 -0000

--00000000000069d7c8056b659e06
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Jonathan Marler <johnnymarler@gmail.com>
---
 device_tree.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 52c3358..2b75905 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -379,8 +379,12 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char
*path)

     r = fdt_get_phandle(fdt, findnode_nofail(fdt, path));
     if (r == 0) {
-        error_report("%s: Couldn't get phandle for %s: %s", __func__,
-                     path, fdt_strerror(r));
+        error_report("%s: Node %s does not have a 'phandle'", __func__,
+                     path);
+        exit(1);
+    }
+    if (r == -1) {
+        error_report("%s: Couldn't get phandle for %s", __func__, path);
         exit(1);
     }

-- 
2.1.4

--00000000000069d7c8056b659e06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Signed-off-by: Jonathan Marler &lt;<a href=3D"ma=
ilto:johnnymarler@gmail.com">johnnymarler@gmail.com</a>&gt;</div><div>---</=
div><div>=C2=A0device_tree.c | 8 ++++++--</div><div>=C2=A01 file changed, 6=
 insertions(+), 2 deletions(-)</div><div><br></div><div>diff --git a/device=
_tree.c b/device_tree.c</div><div>index 52c3358..2b75905 100644</div><div>-=
-- a/device_tree.c</div><div>+++ b/device_tree.c</div><div>@@ -379,8 +379,1=
2 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path)</div><div>=
=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0r =3D fdt_get_phandle(fdt, findnode_no=
fail(fdt, path));</div><div>=C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0) {</div><div=
>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Couldn&#39;t get phand=
le for %s: %s&quot;, __func__,</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path, fdt_strerror(r));</div><=
div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Node %s does not ha=
ve a &#39;phandle&#39;&quot;, __func__,</div><div>+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path);</div><div>+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);</div><div>+=C2=A0 =C2=A0 }</div><div>+=C2=
=A0 =C2=A0 if (r =3D=3D -1) {</div><div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_=
report(&quot;%s: Couldn&#39;t get phandle for %s&quot;, __func__, path);</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);</div><div>=C2=A0 =C2=A0 =
=C2=A0}</div><div>=C2=A0</div><div>--=C2=A0</div><div>2.1.4</div><div><br><=
/div></div></div>

--00000000000069d7c8056b659e06--

