Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomde-0002rM-VX
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:58:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomdc-0002pk-NM
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomda-0003dq-Lb
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:58:32 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:60079)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gomdM-0003Uw-RF; Wed, 30 Jan 2019 04:58:18 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MHo6Y-1gumMm2BCo-00Evfy; Wed, 30 Jan 2019 10:58:10 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
	<1548252536-6242-2-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9b30d086-7006-1345-32d5-b998f96d67af@vivier.eu>
Date: Wed, 30 Jan 2019 10:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1548252536-6242-2-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:VSrUspxB+b8sVA/2DMhka1fDmvqJQSvXbimyNKldKRxWU69K74u
	QWzQ8tZX2ibJZ5QcvnZJ1LkRe0T4Nib3z7iNC6U8HMPmljKGSrpop77HbPpUj4ZL3bI7h1z
	F7lp5o2hRfcIFHBYeo9qw+7aUBrTV60+wVXJFAzqbrr7mJ8kwUVN7SlCV1JZn9SCsadxzoC
	SrEW4JyjhFc8VV4Q5OtOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0VgSHoae/1s=:nNlWxNLhU1E9yqqrKNMd8f
	stvHp9sAcktmqMkRx0b9TL3gKYSpEiE3KeiAN6QLjyoPxsdRodj3xnNtsHqV9MEpSPn7++3LN
	KgO3UTq218isO1YCdzE8sXNRLd60It8lJuu8QyG8SPDzH7NycNKl1jx63Z9cW9pmvneXllgoB
	fCRw+68o7JvjjlbMazJJVseHZJHWfDWjbiesoaEiKNzI2GSn8OfRCuah8FGgQNgBpPylm63my
	rHWbwNtfqw5HQIKvqIPx5B003FOp8qbHJOX3P8bv2fjikXmFsEUOryQyGeyKM8uRx2gGuUlR+
	wtPZRhiftWqmTPxlkKecz8HcxeDWBjMzsqOsWv0ionMMRDYrBgfRjFSMKDtHkwswxaltVwcRB
	nilBp/7lMu9Y1cf7Ktt7ZWNXDpdFjX5fMTu1U/VkVjMI/xTOlaoIz2bEMPjTW9cuVFdJOsISb
	JsA/s4n3VMw+K603Mg4LFa12LVdJnL9L9Eqacqq6BX73iLkMC1ACz512jCm6Y8TMf2RliCPyf
	2DoS3GeN67XaolL5JFbzxSnmQ9+fAZCDIcqBi5QWDudqAsjCHSqf8tRjXrDb7cB6NgM8b5XLc
	OjniyrQkhedVEteYibNCsl4783UJZQ6Khi0et1KxygvPvSGhbiRadmE8dM4oAO4P4XdgIVj38
	fV00KeiIne4AEn+TZaTgZXz6KaCuLhxLqieK3Z0WMSWM++8KZu9/8Gx/r4jtyaiXlxJS4UIXR
	SqeChMN1cLbmqvMh/4edLMgcTerFyqIjOiG5qEoDpLQaOutstFCXS4t9rXw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH 1/4] COPYING.LIB: Synchronize the LGPL
 2.1 with the version from gnu.org
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
X-List-Received-Date: Wed, 30 Jan 2019 09:58:34 -0000

On 23/01/2019 15:08, Thomas Huth wrote:
> The current version of the LGPL 2.1 from gnu.org (see the URL
> https://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt ) slightly
> differs from the old one that we use in our repository. Especially
> the recommendation to use "either version 2 of the License, or [...]
> any later version" is somewhat misleading, since there was never a
> "version 2" of the "Lesser GPL" license - the "version 2" was still
> called "Library GPL" instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  COPYING.LIB | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/COPYING.LIB b/COPYING.LIB
> index 48afc2e..4362b49 100644
> --- a/COPYING.LIB
> +++ b/COPYING.LIB
> @@ -1,8 +1,8 @@
> -		  GNU LESSER GENERAL PUBLIC LICENSE
> -		       Version 2.1, February 1999
> +                  GNU LESSER GENERAL PUBLIC LICENSE
> +                       Version 2.1, February 1999
>  
>   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
> -	51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> + 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
>   Everyone is permitted to copy and distribute verbatim copies
>   of this license document, but changing it is not allowed.
>  
> @@ -10,7 +10,7 @@
>   as the successor of the GNU Library Public License, version 2, hence
>   the version number 2.1.]
>  
> -			    Preamble
> +                            Preamble
>  
>    The licenses for most software are designed to take away your
>  freedom to share and change it.  By contrast, the GNU General Public
> @@ -112,7 +112,7 @@ modification follow.  Pay close attention to the difference between a
>  former contains code derived from the library, whereas the latter must
>  be combined with the library in order to run.
>  
> -		  GNU LESSER GENERAL PUBLIC LICENSE
> +                  GNU LESSER GENERAL PUBLIC LICENSE
>     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
>  
>    0. This License Agreement applies to any software library or other
> @@ -146,7 +146,7 @@ such a program is covered only if its contents constitute a work based
>  on the Library (independent of the use of the Library in a tool for
>  writing it).  Whether that is true depends on what the Library does
>  and what the program that uses the Library does.
> -  
> +
>    1. You may copy and distribute verbatim copies of the Library's
>  complete source code as you receive it, in any medium, provided that
>  you conspicuously and appropriately publish on each copy an
> @@ -432,7 +432,7 @@ decision will be guided by the two goals of preserving the free status
>  of all derivatives of our free software and of promoting the sharing
>  and reuse of software generally.
>  
> -			    NO WARRANTY
> +                            NO WARRANTY
>  
>    15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
>  WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
> @@ -455,7 +455,7 @@ FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
>  SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
>  DAMAGES.
>  
> -		     END OF TERMS AND CONDITIONS
> +                     END OF TERMS AND CONDITIONS
>  
>             How to Apply These Terms to Your New Libraries
>  
> @@ -476,7 +476,7 @@ convey the exclusion of warranty; and each file should have at least the
>      This library is free software; you can redistribute it and/or
>      modify it under the terms of the GNU Lesser General Public
>      License as published by the Free Software Foundation; either
> -    version 2 of the License, or (at your option) any later version.
> +    version 2.1 of the License, or (at your option) any later version.
>  
>      This library is distributed in the hope that it will be useful,
>      but WITHOUT ANY WARRANTY; without even the implied warranty of
> @@ -485,7 +485,7 @@ convey the exclusion of warranty; and each file should have at least the
>  
>      You should have received a copy of the GNU Lesser General Public
>      License along with this library; if not, write to the Free Software
> -    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> +    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
>  
>  Also add information on how to contact you by electronic and paper mail.
>  
> @@ -500,5 +500,3 @@ necessary.  Here is a sample; alter the names:
>    Ty Coon, President of Vice
>  
>  That's all there is to it!
> -
> -
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

