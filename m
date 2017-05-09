Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d8B6M-0001PD-Mi
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 15:47:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1d8B6K-0001Nw-EP
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 15:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1d8B6J-0002Tw-OD
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 15:47:16 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1d8B6E-0002Sd-Iz; Tue, 09 May 2017 15:47:10 -0400
Received: by mail-qk0-x241.google.com with SMTP id y128so1617853qka.3;
	Tue, 09 May 2017 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/OUuxyLp4GB1jNcT70LMtIp1sLDOZWPy9hV5Pe8XbGQ=;
	b=Jtmvw1csXL/uz+Dkafnp6UWLfi9s9iiCTiGQI/+ZUoIK5z+aiaxc2zDoxGk3QjVCxs
	RTbl8mZLVrbnFzGzodRhat7UYdWBLhzGhqxpcYbY/Mujg13BK9g3PIQKNlhOrM/Fc877
	OBcMWvFOFwzART0kHVYtgeBsRXxJ01HUJb6bevqaZSsqwmgNX9VEaScaH08Amsjd6abm
	ieJecKXxboMWTtp09PHVmULxUChXZZkqG8SgB9XM2pcU/cjufnCz+diFQZYmw6LFnI/B
	aJ3tcg2R9S2g6RwChYSi1MNv6RE3mfuQ+4uCsn0HNpTUWJ1Vts7wABSwHIE4T7US8RPe
	X++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/OUuxyLp4GB1jNcT70LMtIp1sLDOZWPy9hV5Pe8XbGQ=;
	b=QtFUeuFY/9BZnq4nM5xVAZ6JSFz8fiEuT6VLos3yK79RAscSMt1K2PjNfhueLeTFlk
	FqXTLT5UJotCmmmPEgpWQIVjf/pDSZ1xBFTO5SVVpu21KcPzaHiV2AEiwH3j2cr20+R0
	IqS8GC6BuOPnVM7nOWeKxYF3hBvWKuedJ8yC9BJd5GXXfjJeqZI7a0XeUE0uGWPIetyV
	pOmKZWFVloiHeIYIZOS0Of1h65XL0ffD5kq/X/nsDzBXsaNLEdJNhucTiPuTPCXowt31
	OirfbagLvhWo6HCAAdyr/YG5thtRkFFVumPmUMTHRr1HEC/YWRaiawRzEhHb/ENAgrhY
	cweQ==
X-Gm-Message-State: AODbwcDB//epEY8cg7X+v7JV6+tHMvO283DlW/TNv+sP4//lxfPl5x/G
	afAEf1diX/gMiA==
X-Received: by 10.55.122.133 with SMTP id v127mr1885895qkc.106.1494359229833; 
	Tue, 09 May 2017 12:47:09 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id t23sm632059qtc.30.2017.05.09.12.47.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 May 2017 12:47:08 -0700 (PDT)
Date: Tue, 9 May 2017 15:47:07 -0400
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"sochin.jiang" <sochin@aliyun.com>
Message-ID: <20170509194707.GA3444@stefanha-x1.localdomain>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
	<046303d38caf2e9919588f87850ac884a48dd567.1494140528.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <046303d38caf2e9919588f87850ac884a48dd567.1494140528.git.mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 11/23] channel-file: fix
 wrong parameter comments
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
X-List-Received-Date: Tue, 09 May 2017 19:47:17 -0000


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 07, 2017 at 10:02:14AM +0300, Michael Tokarev wrote:
> From: "sochin.jiang fix wrong parameter comments in channel-file.h" <sochin@aliyun.com>

Hi Michael,
This patch has a corrupted From field.  I do not modify pull requests
myself when merging.  Could you please resend?

Thanks,
Stefan

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZEhy6AAoJEJykq7OBq3PIz1QH/R9a1mDMYe4H+40VHj2bRnL3
iT/rFVRVIzErT8ri1S8D3XWNzqVj3NgXHTOyuZLdrPoyGTgt/7TCdF946Sry671A
BRai2WH8OkEEz1+0spyL8SX9w88oAoGHwgnAEXLhEf3ba6BXl13azg5fuFOhj6uv
QDcPomOUJohcfOySge2gnoLCWLZtZgnEcpbpNqg+0CtkexYEJPo4tzt6Nnu3FkUI
04LQHKqsRpC2qWIOcEWcrByDp8TYQE6tZ1AOuGgotNWsflPCC9UmiphF3y6LlmHN
yd4r0XBFT/jgjW710u2NGKLG2XTA+NIe6hN7xzo+TEzGvsy1YM2PQOvXG/g6sn8=
=XVRw
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

