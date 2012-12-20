Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TldCF-0000qd-6E
	for mharc-qemu-trivial@gnu.org; Thu, 20 Dec 2012 05:17:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TldCC-0000nZ-5c
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 05:17:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TldCA-0003i7-HU
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 05:17:44 -0500
Received: from mail-qc0-f173.google.com ([209.85.216.173]:41567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TldCA-0003hy-Db
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 05:17:42 -0500
Received: by mail-qc0-f173.google.com with SMTP id b12so1719425qca.32
	for <qemu-trivial@nongnu.org>; Thu, 20 Dec 2012 02:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=NcWT+x7RT0+GJzfry4yZy8Q8KsZ8jAZ4OhhWabhaAzw=;
	b=RnKe6YCD3vGjWLSTWQtFPCNlPvbrfWBhGmp/Ss7Zjl50d7I01Y2C92D+k7uLcJHRZa
	+Ul879ffI6OsCaDFXiALdSIPSGWTp8l5hVx5CU/tj9hBQDB4wtqc78EJs2/ttQ1lcgwJ
	g9LkjfxGZAz3Jqm23uGa7zvRTdS16qQ4tJziUkMAxjKRpzdzedEbOaaoou8bxJRggKWN
	xlo+1Jg4IRLCcMorl3kY7kXABiYrqgfnzKv9TECoRoBEYiBVuErSNH2xyurn+plDnQBZ
	lAGEDuiSYl+YzbgfNqV6+rhl4taClt2n/+NzbT3pG5SEoU9KGZgX0jL95e4MHgDzXnZs
	NabA==
Received: by 10.49.127.101 with SMTP id nf5mr5122545qeb.20.1355998660812; Thu,
	20 Dec 2012 02:17:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.30.103 with HTTP; Thu, 20 Dec 2012 02:17:20 -0800 (PST)
In-Reply-To: <20121220013916.GA10560@cs.nctu.edu.tw>
References: <20121220013916.GA10560@cs.nctu.edu.tw>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Dec 2012 10:17:20 +0000
Message-ID: <CAFEAcA9RU+15ehhoS15Ru95S5kY0Jsru50yJ1UQjNp1jERYU8A@mail.gmail.com>
To: =?UTF-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmtsHd2nwgfqJLuS9sonRs0gl6nHrJXqqAch/YsZM4OYJqpUEMELuGSolFFBpAEXyYNCdSf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, Evgeny Voevodin <e.voevodin@samsung.com>
Subject: Re: [Qemu-trivial] [PATCH v3] translate-all.c: Use
	tb1->phys_hash_next directly in tb_remove
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
X-List-Received-Date: Thu, 20 Dec 2012 10:17:45 -0000

On 20 December 2012 01:39, =E9=99=B3=E9=9F=8B=E4=BB=BB (Wei-Ren Chen) <chen=
wj@iis.sinica.edu.tw> wrote:
>   When tb_remove was first commited at fd6ce8f6, there were three differe=
nt
> calls pass different names to offsetof. In current codebase, the other tw=
o
> calls are replaced with tb_page_remove. There is no need to have a genera=
l
> tb_remove. Omit passing the third parameter and using tb1->phys_hash_next
> directly.
>
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>

Please don't send patches to qemu-trivial but not qemu-devel.

-- PMM

