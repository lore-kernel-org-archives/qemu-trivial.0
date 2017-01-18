Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTjT9-0007GK-Cf
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 01:11:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTjT6-0007Ei-RA
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 01:11:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTjT6-0004H3-3A
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 01:11:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cTjT1-0004Ee-Oi; Wed, 18 Jan 2017 01:11:31 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F048081129;
	Wed, 18 Jan 2017 06:11:31 +0000 (UTC)
Received: from [10.36.116.60] (ovpn-116-60.ams2.redhat.com [10.36.116.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0I6BTcn007874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Jan 2017 01:11:30 -0500
To: Ziyue Yang <skiver.cloud.yzy@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1484709722-3546-1-git-send-email-skiver.cloud.yzy@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Ziyue Yang <yzylivezh@hotmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1485fb07-3948-f5a5-439c-9db721fb50de@redhat.com>
Date: Wed, 18 Jan 2017 07:11:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484709722-3546-1-git-send-email-skiver.cloud.yzy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 18 Jan 2017 06:11:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 2/2] gdbstub.c: update old error
 report statements
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
X-List-Received-Date: Wed, 18 Jan 2017 06:11:37 -0000

On 18.01.2017 04:22, Ziyue Yang wrote:
> From: Ziyue Yang <yzylivezh@hotmail.com>
> 
> Some updates from fprintf(stderr, ...) to error_report.
> 
> Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
> ---
>  gdbstub.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 426d55e..fe1d0f8 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -637,8 +637,8 @@ void gdb_register_coprocessor(CPUState *cpu,
>      *p = s;
>      if (g_pos) {
>          if (g_pos != s->base_reg) {
> -            fprintf(stderr, "Error: Bad gdb register numbering for '%s'\n"
> -                    "Expected %d got %d\n", xml, g_pos, s->base_reg);
> +            error_report("Error: Bad gdb register numbering for '%s', "
> +                         "Expected %d got %d", xml, g_pos, s->base_reg);

Since the message is now printed in one line with a comma in between,
I'd maybe rather write "expected" without capital letter.

 Thomas


