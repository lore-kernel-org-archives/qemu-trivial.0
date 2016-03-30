Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alGpA-000537-33
	for mharc-qemu-trivial@gnu.org; Wed, 30 Mar 2016 10:10:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1alGp5-0004wQ-Qx
	for qemu-trivial@nongnu.org; Wed, 30 Mar 2016 10:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1alGp0-0007x2-0I
	for qemu-trivial@nongnu.org; Wed, 30 Mar 2016 10:10:15 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:32929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1alGoo-0007nW-Dp; Wed, 30 Mar 2016 10:09:58 -0400
Received: by mail-wm0-x230.google.com with SMTP id r72so101445015wmg.0;
	Wed, 30 Mar 2016 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BuRgMHT7x6F05Ew3oS7v1HyCv0VUsQcs3w13PAzN3AY=;
	b=snsEcgCVOORMRi05SMj/RaPZc0QWmWC739GX/IHVCCU77mjyg5F7XeQZ9vfm5YN8Zs
	4Ay0Yxi26d+mpyyU2juoKsYgkxtQq/E+vtyOzht0IEwFuWyw/GtJdpuIpPDgJ3es5uGp
	sqgLnNGhUjYLnH+52LRsTjFz5hL/2hOyGGKXZTZ8XJW4aV3h6kQARIovLBv6Xtxolax/
	wuIYq2nWxeZBp/ixndQcNj5Tsh087ng5ogzYFct+BaaUDzUbHRnqXmubcf6LVcMfsonR
	dqO6xDykKFcUR2fFMiBaQC7KuHgRtnymaPYOXk2MjJ+cdc/FgT7KsRu8lB3Xuo92AUKp
	EljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BuRgMHT7x6F05Ew3oS7v1HyCv0VUsQcs3w13PAzN3AY=;
	b=SaZ5I50UaxsdvGOwEzoqwdVyUabDvOuDK44ESQwtV3GhSONRg2o4FvydHYte/mZt1A
	ionVYEwDVJqROE+eedyTiC7iqxHY+V1n1OOLsYDAZ0NWlhxWPfXClLziaxwBRPnYvR5e
	XbZTQEhvn0ytiZPcgP2j/uqueqEpCEZsP+ghV8XMYz2dwTrXqHRWpxZ9IOnrTVkjKddr
	uLtpCioHhkfeCHWqySNAlK9HuCe7gLg0Ve1ByHtuQ0l8N4d/s4XeWrVfiWBF7cxYPwLS
	oYBSrQsLkaCq9hrNz+Ym1JGxcOwMpznGYVMRtWqmKn8+m1SvzGb9rPSdqBn0O6FzoRX4
	8WZg==
X-Gm-Message-State: AD7BkJJ6kbs3BSW4tjK8LdNiHYH9VmvHKTFQi/cTNifAioesGC1MEebNvQCOt9zM6f6+0w==
X-Received: by 10.194.92.237 with SMTP id cp13mr9884143wjb.168.1459346997481; 
	Wed, 30 Mar 2016 07:09:57 -0700 (PDT)
Received: from localhost (host109-156-68-66.range109-156.btcentralplus.com.
	[109.156.68.66])
	by smtp.gmail.com with ESMTPSA id c71sm4670493wmd.4.2016.03.30.07.09.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Mar 2016 07:09:56 -0700 (PDT)
Date: Wed, 30 Mar 2016 15:09:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Md Haris Iqbal <haris.phnx@gmail.com>
Message-ID: <20160330140955.GA2557@stefanha-x1.localdomain>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-Devel] [PATCH] Changed malloc
 to g_malloc, free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Wed, 30 Mar 2016 14:10:19 -0000


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2016 at 12:02:03AM +0530, Md Haris Iqbal wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> ---
>  linux-user/qemu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 26b0ba2..3c3fd15 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong gue=
st_addr, long len, int copy
>  #ifdef DEBUG_REMAP
>      {
>          void *addr;
> -        addr =3D malloc(len);
> +        addr =3D g_malloc(len);
>          if (copy)
>              memcpy(addr, g2h(guest_addr), len);
>          else
> @@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi_ul=
ong guest_addr,
>          return;
>      if (len > 0)
>          memcpy(g2h(guest_addr), host_ptr, len);
> -    free(host_ptr);
> +    g_free(host_ptr);
>  #endif
>  }

If I understand correctly either lock_user() or lock_user_string() may
be followed by unlock_user().  If you change unlock_user() to g_free()
then you also need to change lock_user_string() to g_malloc() to avoid a
malloc()/g_free() mismatch.

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW+94zAAoJEJykq7OBq3PID9kH/301FB1pmgBm8p3YDx67zhVc
jvUPaNW7h6IR6jRB1XpzZFGyTcpUL+1ubboRrPFspU/302VH9A9nhl7jkPTzZRji
1Dt5SsO1rXUkV5jwTJo+CXcpRrzTIsUimKi0/ks+DQIoz4S3efaM4BmDD8K6W/9w
YxM+Cs1MRiL0KzhvlB4lrofnd2pAM9c3C1/NyT4odC5ysBjM0kUGOWDCNmsB+ZLJ
l741lL2tenQZgKTFgp2DLR6USfsDjxezzrwo16QC7Prq+Hw+d+fyeW6MU354/mmG
XgKam9+i4ed67+TLyRylSI9XdkqEmRELOTB6TOVX+oMMUNvACiQMoqnXFLlO7PE=
=ot69
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

