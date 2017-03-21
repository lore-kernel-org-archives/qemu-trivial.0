Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqKcM-0003Mi-FY
	for mharc-qemu-trivial@gnu.org; Tue, 21 Mar 2017 10:18:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqJPa-00065W-BE
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 09:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqJPU-0000fJ-GS
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 09:01:18 -0400
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vfeenstr@redhat.com>) id 1cqJPU-0000el-Av
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 09:01:12 -0400
Received: by mail-wm0-f49.google.com with SMTP id n11so11527206wma.1
	for <qemu-trivial@nongnu.org>; Tue, 21 Mar 2017 06:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=YCtvI7EkjX8EM/C3NBJfFVOsTtH7dBvRZna+qISZqA8=;
	b=RoPzYYbjky0HxLSkjl8CuNGqXAGNXeE2IpNGj1Q+disndLgW8ZRlCTD98nNs/tL/Ru
	+/Ge7entPM0yg/fq7JDXTM2KdQQjqpWCINhRF6uB286DAfpde4zNsxZpfIFrWO82QY+6
	JK5Z6HSLRsQjfVZGuIrSNp9YEu/YtOesEj4vXIR8b0xBgB2YkZ1cyuvvc6eOscc9Lwbz
	hfAeHD16QDk4BZ31OHA7H/MtGrf4QFYcLIAZ81l/oW8+/Wgy6tZdwLIruczJDJXvQ3sd
	DuNQcaG9HlFavfek5AEm1vAMphJ1vI/MO0NE7drxqGCq5wvJNMhiGDyO0IHvEixm3hTE
	Q76A==
X-Gm-Message-State: AFeK/H3fem4WBcKUnHAqca+FlAxSmSccGt7yOrlWynnHQwiFGL6LRe/jBARvy5P+zFZ/NRVJ
X-Received: by 10.28.203.197 with SMTP id b188mr2940294wmg.110.1490101271137; 
	Tue, 21 Mar 2017 06:01:11 -0700 (PDT)
Received: from dhcp131-51.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10]) by smtp.gmail.com with ESMTPSA id
	y4sm14612698wra.16.2017.03.21.06.01.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 06:01:10 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
From: Vinzenz Feenstra <vfeenstr@redhat.com>
In-Reply-To: <CAFEAcA-bu9noosLApv83U2WAs27q4Kx2zVv_xpZtWjL=64VSdA@mail.gmail.com>
Date: Tue, 21 Mar 2017 14:01:09 +0100
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <494FFBCD-C622-41B8-827B-171E89970971@redhat.com>
References: <20170316111416.25587-1-vfeenstr@redhat.com>
	<CAFEAcA-bu9noosLApv83U2WAs27q4Kx2zVv_xpZtWjL=64VSdA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3259)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.49
X-Mailman-Approved-At: Tue, 21 Mar 2017 10:18:32 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] checkpatch: Supress warning
 in function pointer typedefs
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
X-List-Received-Date: Tue, 21 Mar 2017 13:01:24 -0000


> On Mar 21, 2017, at 1:37 PM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On 16 March 2017 at 11:14, Vinzenz 'evilissimo' Feenstra
> <vfeenstr@redhat.com> wrote:
>> From: Vinzenz Feenstra <vfeenstr@redhat.com>
>>=20
>> When importing dynamically functions via `GetProcAddress` in windows
>> related code, it is quite common to make a typedef for the resulting
>> function pointer. When the function to be imported, has a stdcall
>> calling convention, usually the `WINAPI` macro is used. This patch =
adds an
>> exception in the checkpatch.pl script to allow the calling convention
>> specification in function pointer typedefs, to be `WINAPI`.
>>=20
>> Signed-off-by: Vinzenz Feenstra <vfeenstr@redhat.com>
>=20
> Could you provide an example of the kind of source line that provokes
> the incorrect warning and the checkpatch output that results,
> please?

Hmm I just realize that it is working now, but I figured out now what is =
the real problem and that
my patch is wrong. Please discard this patch and thanks for making me =
think again :-)

>=20
> thanks
> -- PMM


