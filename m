Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UeTXF-0000aC-G3
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2013 13:06:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UeTX8-0000Ye-Bj
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 13:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UeTX3-0002ee-97
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 13:06:02 -0400
Received: from mail-ye0-f176.google.com ([209.85.213.176]:32844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UeTX2-0002eR-Pc; Mon, 20 May 2013 13:05:57 -0400
Received: by mail-ye0-f176.google.com with SMTP id m13so399776yen.21
	for <multiple recipients>; Mon, 20 May 2013 10:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=Bp0f+BSuUfijlP54fJPciC8HLLbYAx10pXNs5z3B8to=;
	b=Mj1HA28/NckCKisSga7/IBgsa6ddJ2Wjc0QpudaQPSK7MNL3Gq67Ny9HMbvtFw3Cep
	43OK1eTKrZ6ynFbDUnqJF57JpZhHgkEhTmtYscXAlC0AN9oUojhXugrmv74Mkq5mUdN+
	RCUNEIYjNnA1RcbrfL0RHA1oVjgUBvThxpXJVB9RDD1QUc/VgCDw16O5Gd0fN0YaXAvW
	n3pfmE7+rr2d7DcI9B8n/sueLWkunMKQKbXDGVUjSjsp89J2Nbqo02e5Ghz/v3lTuCpw
	PY5/UY2RFbavCYrTynf2HIqx6eFVBRlv7dCgyMmqupQwbVqZ6kDmyS0hO37SpY9deFjr
	hilA==
X-Received: by 10.236.60.1 with SMTP id t1mr11519030yhc.197.1369069556304;
	Mon, 20 May 2013 10:05:56 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-223-193.cust.dsl.vodafone.it. [37.116.223.193])
	by mx.google.com with ESMTPSA id g70sm41350155yhm.7.2013.05.20.10.05.51
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 20 May 2013 10:05:55 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <519A57E8.9090101@redhat.com>
Date: Mon, 20 May 2013 19:05:44 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A522F.80305@redhat.com>
	<CAFEAcA_VhTQvsE-XYa4pFZBXJq1kyMeOTp8ccxcLtriQJre+OA@mail.gmail.com>
	<519A55F3.8090101@redhat.com>
In-Reply-To: <519A55F3.8090101@redhat.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.176
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, John Rigby <john.rigby@linaro.org>,
	qemu-devel@nongnu.org, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema.json: Reformat TargetType
	enum to one-per-line
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
X-List-Received-Date: Mon, 20 May 2013 17:06:08 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Il 20/05/2013 18:57, Eric Blake ha scritto:
> Changing the name of an architecture would be reflected by having
> a different qemu-FOO binary name, right?  If that's the case, then 
> introspection of which architectures are supported is done by
> listing all the matches to qemu-* in the directory where binaries
> are installed, and we don't need a QMP enum duplicating what the
> file system already tells us.

Yes, that was exactly my point (plus, those binaries might well come
from different versions of QEMU).

Paolo
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRmlfnAAoJEBvWZb6bTYbyDq0P/AkeSq6btQY4noFbY7WQwN3k
4+uDUjtwvobsuoqvEKYKMCo6MDyJnfNkgX7S6aNSj+v5+59/tlS0evjgj0N76FGj
GC2FcDmmqu3OSt9+2i+pU6gs3eSk6UFbZ9/nxI9hzJ5aaPq6vCr/0l/lR1Ru5op6
W6705VDwp13jhgx+P14OfwI3qLztIP6/mL8Mc58J+7Y+GQ2SCs1CPJgUH4EW76Qg
uSOZ6FuNan7Hv+aNdUBXeXRteT4AfzwiGeCi2Z5zxvztUJr9YsOx+TKD/6HbO+1l
mLyHsOAEba6Ic9N8t/kZLh8yMK44WMcTX7Xnc583NZOz/njBS3+wJqBQLaggj37N
FX0w0lYkcbflqIei9YKK5X2Pex8tOQxHB7NDoGgcXQiOtMC8s3CJ1J91PaPrEprm
m9s9PXtZ+AXO4gt1cH5sofdPY5NiIChQOjgmp4TFf90NG1+t0DLIqnJaA0BWKEBl
uQbdyV3jUyZOdF0hgGRhrt0S1MuOS2e+cCVj1/qNmoAFMkFKEKevInS3QxH2kSNs
wkjBHZ9g7LU8LO4qyBCpp4mxepsrKh9kgGnJDkx6cVULC3jkjbSqeORFYblgp/lm
4ZWc95r1m8XkLaIrxuA5DPO1yuHT/bfZiZp1KiwMRVD3vI877y31nUeSK8jdv3Rp
iVzfr9t7+uWYWRF3t516
=81Fx
-----END PGP SIGNATURE-----

