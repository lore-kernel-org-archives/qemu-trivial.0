Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKSDH-0000UI-Ia
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 12:01:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKSD8-0008Ls-2h
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 12:01:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKSD0-0004Ba-UQ
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 12:01:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKSCq-00043H-SD; Thu, 30 Nov 2017 12:01:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A983F5FD4E;
	Thu, 30 Nov 2017 17:00:59 +0000 (UTC)
Received: from [10.10.122.213] (ovpn-122-213.rdu2.redhat.com [10.10.122.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3818B60BE5;
	Thu, 30 Nov 2017 17:00:59 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130140154.11161-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <04c922b4-7287-61e7-1afc-4e64f39c52a5@redhat.com>
Date: Thu, 30 Nov 2017 11:00:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171130140154.11161-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 30 Nov 2017 17:00:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/3] checkpatch: Enforce
 proper do/while (0) style
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
X-List-Received-Date: Thu, 30 Nov 2017 17:01:23 -0000

On 11/30/2017 08:01 AM, Eric Blake wrote:
> while (0) is only idiomatic in a macro definition, where the caller
> will be supplying the trailing ';'.  Warn if the macro has a duplicate.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   scripts/checkpatch.pl | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 34df753571..acb66bff34 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1622,6 +1622,11 @@ sub process {
>   			}
>   		}
> 
> +# 'while (0);' is odd; only macros should use while (0), without trailing ;
> +		if ($line =~ /while\s*\(0\);/) {

Should this also check for uses of 'while (false);' ?

Interestingly enough, we have an instance of 'do/while (false);' in 
tests/vhost-user-bridge.c that is NOT in a macro, but is used for the 
convenience of being able to 'break;' out early rather than using a 
goto.  Similarly for chardev/char-serial.c using 'while (0);' outside of 
a macro.  Those may be worth rewriting to use goto as separate patches 
if we want to restrict ALL use of 'while \((0|false)\);'

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

