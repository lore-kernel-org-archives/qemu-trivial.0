Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dI8dF-0005KU-Pk
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jun 2017 03:10:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dI8dD-0005Ik-9Q
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 03:10:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dI8dC-00016O-FO
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 03:10:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dI8d8-0000yH-46; Tue, 06 Jun 2017 03:10:18 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 458D9406D7;
	Tue,  6 Jun 2017 10:10:06 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 25E2C5E6;
	Tue,  6 Jun 2017 10:10:06 +0300 (MSK)
To: Markus Armbruster <armbru@redhat.com>, Kamil Rytarowski <n54@gmx.com>
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
	<df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com>
	<877f0p38tr.fsf@dusky.pond.sub.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com, peter.maydell@redhat.com, f4bug@amsat.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <b60c5d7b-6ae7-4aa0-6263-b96c964b9195@msgid.tls.msk.ru>
Date: Tue, 6 Jun 2017 10:10:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <877f0p38tr.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
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
X-List-Received-Date: Tue, 06 Jun 2017 07:10:24 -0000

06.06.2017 09:54, Markus Armbruster wrote:

[ ./configure --disable-linux-user --disable-system --static ]

> I haven't, but here's a quick guess on what we need to squash into the
> patch:
> 
> diff --git a/Makefile b/Makefile
> index c830d7a..2ef5a78 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -469,10 +469,12 @@ ifneq ($(EXESUF),)
>  qemu-ga: qemu-ga$(EXESUF) $(QGA_VSS_PROVIDER) $(QEMU_GA_MSI)
>  endif
>  
> +ifdef CONFIG_IVSHMEM
>  ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
>  	$(call LINK, $^)
>  ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
>  	$(call LINK, $^)
> +endif

This effectively disables building ivshmem executables on this config
on linux, while previously they were building fine. Hmm..

/mjt

