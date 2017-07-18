Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXVdF-0004re-49
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 12:45:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXVdD-0004pO-76
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXVdC-00015c-96
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:45:55 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:34860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXVdC-00014X-3r; Tue, 18 Jul 2017 12:45:54 -0400
Received: by mail-io0-x243.google.com with SMTP id f1so1257320ioj.2;
	Tue, 18 Jul 2017 09:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=uarsrpfxsTowdgmYPdt4A7vGoteeajzROSlKAr7bOXQ=;
	b=G8mEeHMnwWLiaknPhLzSuDsaSeLE6wBw7t1YjGAmRLUOkjl4AbXBoHzNAbuHM5bYZs
	R1CfLzEEdn1usnhRXKEiqgS39qZmvqQTcE6A0x4Jlk0qvhqnlEYffsVYNTH/KYRZNFSq
	AVz9Uvqs8xie9HnULBjpENYYZq9mEnqUE2momjYek03Qt76uD88tmDt5pWgGexxO1Kzt
	K8fP87f3thsbjcPU2OxkxsA/Hk4yHsZTbXK6E4YYyrYX/5j0yfAa939Xpi3VwwJGgs/Y
	NgNjqZM9mWtUtKPpOwrjZ2f1UJ3H/MyLBB8fUcU8Pbw0Q+Jp4a1VJdMv0ucqbBPoP1g6
	Q0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=uarsrpfxsTowdgmYPdt4A7vGoteeajzROSlKAr7bOXQ=;
	b=b1lZ8dvTwXGAAKU6DluOzZvaV8Z8NhC6vtN0NWCG9i7o9CqbnaWVpqWkaVXWFTogBk
	pmEvgsMvil1MMcVevwI02IXNEh6xgxvz1rsdmSc9gXw8B3Kbus/oFRZhBBhjKZLUWcjK
	87UHbB/SnM6XmadBjKvchT8QKqGOc73BU+Xf0x280Rcd9bPDqJE14XJLlsh3uLVVyLO3
	Ly8rClrqtQAOIIbUq+WYlB4UQD87Vnrc7xrm5QVqIJkpOZU0kViki7a9R8/XfAb5nImJ
	ZbvZ0axSy3XtBRhKyJOdY+Mj2H5rW4IqMEGuJSgY9cuDPhIRAZuKRStbvGQRLaaSdbmi
	PZrg==
X-Gm-Message-State: AIVw112adiZSVv6vtbIfXSfvooIDZRexTW9jyJgxXnsnVyHP3aXONrfC
	hwPQr9GnM0z3g4PN4uytwbwGesSjUA==
X-Received: by 10.107.46.230 with SMTP id u99mr2660165iou.52.1500396353361;
	Tue, 18 Jul 2017 09:45:53 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.107.152.16 with HTTP; Tue, 18 Jul 2017 09:45:52 -0700 (PDT)
Received: by 10.107.152.16 with HTTP; Tue, 18 Jul 2017 09:45:52 -0700 (PDT)
In-Reply-To: <1500395194-21455-2-git-send-email-peter.maydell@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 18 Jul 2017 13:45:52 -0300
X-Google-Sender-Auth: lgA8ZbV3gfMXslXsUIHEH9VsGwc
Message-ID: <CAAdtpL7WjJWC1KT2fuZv=b2obT9dJwPgYp=QQK0agdVNhhn=tw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	patches@linaro.org
Content-Type: multipart/alternative; boundary="001a11c16a96aab3a505549a3f27"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 1/4]
 bsd-user/mmap.c: Move __thread attribute to right place
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
X-List-Received-Date: Tue, 18 Jul 2017 16:45:56 -0000

--001a11c16a96aab3a505549a3f27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Le 18 juil. 2017 1:29 PM, "Peter Maydell" <peter.maydell@linaro.org> a
=C3=A9crit :

> Avoid a compiler warning on OpenBSD:
> bsd-user/mmap.c:28:1: warning: '__thread' is not at beginning of
> declaration [-Wold-style-declaration]
> by moving the __thread attribute to its proper place.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  bsd-user/mmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 7f2018e..20cd29d 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -25,7 +25,7 @@
>  //#define DEBUG_MMAP
>
>  static pthread_mutex_t mmap_mutex =3D PTHREAD_MUTEX_INITIALIZER;
> -static int __thread mmap_lock_count;
> +static __thread int mmap_lock_count;
>
>  void mmap_lock(void)
>  {
> --
> 2.7.4
>
>
>

--001a11c16a96aab3a505549a3f27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-family:sans-serif;font-size:13.696px"=
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;</span><a href=3D"mailto:f4bu=
g@amsat.org" style=3D"text-decoration:none;color:rgb(66,133,244);font-famil=
y:sans-serif;font-size:13.696px">f4bug@amsat.org</a><span style=3D"font-fam=
ily:sans-serif;font-size:13.696px">&gt;</span></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">Le=C2=A018 juil. 2017 1:29 PM, &quot;Pet=
er Maydell&quot; &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayd=
ell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br type=3D"attribution"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Avoid a compiler warning on OpenBSD:<br>
bsd-user/mmap.c:28:1: warning: &#39;__thread&#39; is not at beginning of de=
claration [-Wold-style-declaration]<br>
by moving the __thread attribute to its proper place.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0bsd-user/mmap.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c<br>
index 7f2018e..20cd29d 100644<br>
--- a/bsd-user/mmap.c<br>
+++ b/bsd-user/mmap.c<br>
@@ -25,7 +25,7 @@<br>
=C2=A0//#define DEBUG_MMAP<br>
<br>
=C2=A0static pthread_mutex_t mmap_mutex =3D PTHREAD_MUTEX_INITIALIZER;<br>
-static int __thread mmap_lock_count;<br>
+static __thread int mmap_lock_count;<br>
<br>
=C2=A0void mmap_lock(void)<br>
=C2=A0{<br>
--<br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--001a11c16a96aab3a505549a3f27--

