Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYV5h-0006pY-UW
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 06:23:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYV5f-0006nL-9J
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYV5e-0000CH-Fa
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:23:23 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:38696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYV5e-000090-8U
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:23:22 -0400
Received: by mail-wr0-x22b.google.com with SMTP id f21so24177934wrf.5
	for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2017 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oVoi+nDiyWOgCQVQlNPROju7kYJ8PzU6VyUdHMQ/jN0=;
	b=TDaOP6avSraF7By+gIuNr7ndcYvrs/J1Gk3UMpZwhEwkVCtjvgXj/l57Gfd2bzj0ar
	N6TNhzz/CrOR7+oJmezFSGkwvih7jEGVJdoyounxiLb77BEkkLyYbnj/XmDZhZ7vJUh0
	fer2S6Oau7LeZpAnsNscKESiVGEoZpkWDvccY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oVoi+nDiyWOgCQVQlNPROju7kYJ8PzU6VyUdHMQ/jN0=;
	b=J1+bmZ1RC+F8E3hmt/jEZlBIewKfBsrHQ46pOUynEtNuCN7SqQhbE8rF5UnQvMlkcp
	ddoN3o4AgJbrY4RIdGNFX4DPDaSSG4MyVjnazHVaEFQPGK7am0OKfeJMJLVQ2QInPnDQ
	eAjTwa7ytTS3nkuN5aig9FUdHwuuDNhH/mziPJp+L8srk3AOYWP9wYSY2Dn9kbPwchjp
	WcBBJZK5R5dp7Jlh9C8SiE6/XqHvWO9EURyrnykl4IhiM9fFIvKOWZwTnPuskTYX+wCO
	3RtwCf/aCXK1aH8fqs8PuCS4dD8cSaQK8DMJtXbedSh4CTSK60fHlB4F9ckBVI3cByg3
	1ihQ==
X-Gm-Message-State: AIVw110wAVT2VanF/W1IynB0CnER7SuvW4LvZV0ue4xbCfyrp7AIUpSL
	diwhwanlMG35wB1MvMw9pM+lmOB/HlY4
X-Received: by 10.223.165.129 with SMTP id g1mr1096680wrc.167.1500632599529;
	Fri, 21 Jul 2017 03:23:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 03:22:59 -0700 (PDT)
In-Reply-To: <eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
	<eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 11:22:59 +0100
Message-ID: <CAFEAcA_mOeR2jTGuik6Jig972vMW5JTqQFaoZzt5_9oaG7D+aA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kamil Rytarowski <kamil@netbsd.org>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10]
 util/oslib-posix.c: Avoid warning on NetBSD
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
X-List-Received-Date: Fri, 21 Jul 2017 10:23:24 -0000

On 20 July 2017 at 19:26, Eric Blake <eblake@redhat.com> wrote:
> On 07/20/2017 11:32 AM, Peter Maydell wrote:
>> On NetBSD the compiler warns:
>> util/oslib-posix.c: In function 'sigaction_invoke':
>> util/oslib-posix.c:589:5: warning: missing braces around initializer [-Wmissing-braces]
>>      siginfo_t si = { 0 };
>>      ^
>
> Uggh. That is a broken compiler.  C99 declares that 'anything = {0}' is
> supposed to be a valid way to zero-initialize anything.
>
>> util/oslib-posix.c:589:5: warning: (near initialization for 'si.si_pad') [-Wmissing-braces]
>>
>> because on this platform siginfo_t is defined as
>>   typedef union siginfo {
>>           char    si_pad[128];    /* Total size; for future expansion */
>>           struct _ksiginfo _info;
>>   } siginfo_t;
>>
>> Avoid this warning by initializing the struct with {} instead;
>> this is a GCC extension but we use it all over the codebase already.
>
> Well, I'm glad that works to shut up the broken compiler.
>
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  util/oslib-posix.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks; applied to master.

-- PMM

