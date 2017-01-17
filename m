Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTXXO-0002m0-Hv
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 12:27:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTXXN-0002la-3A
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 12:27:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTXXM-000464-9r
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 12:27:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cTXXH-000453-QJ; Tue, 17 Jan 2017 12:27:07 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B13AE15567;
	Tue, 17 Jan 2017 17:27:07 +0000 (UTC)
Received: from [10.36.116.99] (ovpn-116-99.ams2.redhat.com [10.36.116.99])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0HHR48R025255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 Jan 2017 12:27:05 -0500
To: Ziyue Yang <skiver.cloud.yzy@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1484666391-15089-1-git-send-email-skiver.cloud.yzy@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Ziyue Yang <yzylivezh@hotmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c1e01bb3-6dd1-dfe1-1659-8b7b9b683d63@redhat.com>
Date: Tue, 17 Jan 2017 18:27:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484666391-15089-1-git-send-email-skiver.cloud.yzy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 17 Jan 2017 17:27:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub.c: fix GDB
 connection segfault caused by empty machines
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
X-List-Received-Date: Tue, 17 Jan 2017 17:27:14 -0000

On 17.01.2017 16:19, Ziyue Yang wrote:
> From: Ziyue Yang <yzylivezh@hotmail.com>
> 
> This patch is to fix the segmentation fault caused by attaching
> GDB to a QEMU instance initialized with "-M none" option.
> 
> The bug can be reproduced by
> 
>> ./qemu-system-x86_64 -M none -nographic -S -s
> 
> and attach a GDB to it by
> 
>> gdb -ex 'target remote :1234
> 
> The segmentation fault was originally caused by trying to read
> the information about CPU when communicating with GDB. However,
> it's impossible for any control flow to exist on an empty machine,
> nor can CPU's be hot plugged to an empty machine later by QOM
> commands. So I think simply disabling GDB connections on empty
> machines makes sense.

Yes, this sounds like a proper and easy fix for the problem.

> Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
> ---
>  gdbstub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index de62d26..413e817 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1731,6 +1731,12 @@ int gdbserver_start(const char *device)
>      CharDriverState *mon_chr;
>      ChardevCommon common = { 0 };
>  
> +    if (!first_cpu) {
> +        fprintf(stderr, "gdbstub: meaningless to attach gdb to a "
> +                "machine without any CPU.\n");
> +        return -1;
> +    }

Could you maybe rather use error_report() instead of fprintf()? I think
that's the preferred way to print out an error in QEMU nowadays.

 Thomas


