Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBnqK-0003jl-S0
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 15:18:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eBnqI-0003iF-5V
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 15:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eBnqG-0006zk-S1
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 15:17:58 -0500
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:43212)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1eBnqG-0006zE-Nx; Mon, 06 Nov 2017 15:17:56 -0500
Received: by mail-qt0-x22a.google.com with SMTP id j58so12600030qtj.0;
	Mon, 06 Nov 2017 12:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+NOQg2f2VCsQeM5QynxPLvjSXaAzmaATvQdqGb6SLFQ=;
	b=HeuxrIsgBXZ3kd2gPhUyRUrMrYIldkRb29qsqooXz4MTz2HLbPsWO8qTHyE1ezxeR2
	9dXE4J+/RDNiAUPPrtvEGGo7+O/A9uN13I0pma0gJ+jD0qtIxc/cn6H1YtKf9WSlDjyQ
	3HrO67C8r6abW1TEhRm6/1kjX4JNPQXfcY0/s6Lrmoa1J59O4TrqWzqgmbdil7q5LoSm
	vq1bn/yCDqFKekzan4djcQ/x591rFRWK2K+m1Kh9/ovZVAwgX3OHHJ0Yry2YTxONZ/Je
	AKT7ZNvcphJGy9lN8s6BqHC6DREIs0WYeu9rbimjyt7S7YLF/VFWYvjhTfGsf4g6JtmB
	CEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+NOQg2f2VCsQeM5QynxPLvjSXaAzmaATvQdqGb6SLFQ=;
	b=OIVowY894PllfLx9HmJUKOU9meKPPOAboWGI7q2zLZIGzd81GZaO71Bxw1vwnfRQXQ
	xt6Gr7q2O6lXDqrhlIqRLwzRzpxZGnOZwkzgSIpBNy1ANwPMp9S6zVOTZt3sCtFKVy6+
	g9Y8AzZnNL3x1zIKuNjkf9UT8glSsFTVerGbY2IHdaQiqrpWXBG+y4cPV4ppxFyW8FlH
	dnezgaRRsE5URYxmWqfHuoOb6OM60pzDhY0YUjZWvdSgQ2t6QGdwZl3goFR31s/oK7+n
	2UpGuBP7VmuYBNHyFPigerEkJeDAxEhUaEJSTnfA+1wS9Zj7sTPh3ZEZFj8aJSzr2HA7
	dSZg==
X-Gm-Message-State: AMCzsaVzHrPYRm/8QuxB9C7+t2NXPzZmkvb/fsEGuO1n+KvXlqTLY/6D
	ARJPSAkxNXi3/xgvaooGmHAdblt/tMce0CivS10=
X-Google-Smtp-Source: ABhQp+SmavZpXMKF0jGCcX8KPimtEj18qCXqTbmuCWBvAXffgWuiwbgF2mo/umzWNsIsB0D0eLGiVa+rYCMYvWvh7Y4=
X-Received: by 10.200.17.1 with SMTP id c1mr23042517qtj.252.1509999475708;
	Mon, 06 Nov 2017 12:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
	<CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
	<CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
	<2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
	<CAFEAcA-r-KxNDkHFJEdQDVnNXf4N-8zptjQK9a-uPixnSMsg+w@mail.gmail.com>
In-Reply-To: <CAFEAcA-r-KxNDkHFJEdQDVnNXf4N-8zptjQK9a-uPixnSMsg+w@mail.gmail.com>
From: Zach Riggle <zachriggle@gmail.com>
Date: Mon, 06 Nov 2017 20:17:44 +0000
Message-ID: <CAMP9c5krrvH-TpH0mM1D3Fm8=E+C7nYHU8h3b5CwU1Nb2HxN-A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Blake <eblake@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="089e082651685c5a80055d5626de"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Mon, 06 Nov 2017 20:17:59 -0000

--089e082651685c5a80055d5626de
Content-Type: text/plain; charset="UTF-8"

Ping! What needs to be done to move this forward? My current implementation
is compatible with musl.
On Thu, Nov 2, 2017 at 12:36 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 28 October 2017 at 06:14, Eric Blake <eblake@redhat.com> wrote:
> > By definition, in linux-user, we ARE using glibc; therefore, you are
> > free to use all GNU extensions.
>
> Don't we also support musl libc? I forget...
>
> thanks
> -- PMM
>

--089e082651685c5a80055d5626de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping! What needs to be done to move this forward? My current implementation=
 is compatible with musl.<br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Thu, Nov 2, 2017 at 12:36 PM Peter Maydell &lt;<a href=3D"mailto:peter.may=
dell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On 28 October 2017 at 06:14, Eric Blake &lt;<a href=
=3D"mailto:eblake@redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt; w=
rote:<br>
&gt; By definition, in linux-user, we ARE using glibc; therefore, you are<b=
r>
&gt; free to use all GNU extensions.<br>
<br>
Don&#39;t we also support musl libc? I forget...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--089e082651685c5a80055d5626de--

