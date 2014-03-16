Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WP5zi-0006uu-Gd
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 04:00:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WP5zX-0006cn-KP
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 04:00:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WP5zP-0004ew-6H
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 04:00:19 -0400
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231]:41729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WP5zO-0004eq-Ux; Sun, 16 Mar 2014 04:00:11 -0400
Received: by mail-ee0-f49.google.com with SMTP id c41so2916745eek.36
	for <multiple recipients>; Sun, 16 Mar 2014 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=SBkMZm2NCMcY/u6g43rpZA0iQh45XCR22ZajxXowUv4=;
	b=ryI069yWUEfkM3ekYcAYqC3G+WIg/Pd22FsOo30/xwMgnKEP7F1UehszgVQJ+Mo/Fi
	uFL+ppMmD6jNUZPaJd7memCZ3i5lrZX0eQJCZnhcuM+C9TotRisezFzjsJCA3qEonzmX
	WrHdn5ibZ1U9xJlRdQskccKjvBQo9nYE4RfzVId9WeU9s5L9KrYiJEBSzsX+0wtfj8nD
	GsjO5vVfE3fNpyk52bsGvDVZRheiOgTuV8ZLUinIBiaAXbrp9IpXQ3CqJEWnOuyBZzo7
	TpBBRe5u/QMjXfaSLeXkfPcfOTw2guKqvlJlKKfZ8O48HCj2u0RdIyIgZYIcerbf3tCI
	vIlg==
X-Received: by 10.14.241.139 with SMTP id g11mr9895149eer.49.1394956809735;
	Sun, 16 Mar 2014 01:00:09 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id m8sm30294908eef.14.2014.03.16.01.00.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Mar 2014 01:00:07 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <532559FE.4060808@redhat.com>
Date: Sun, 16 Mar 2014 08:59:58 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1394908420-6981-1-git-send-email-pbonzini@redhat.com>
	<CAFEAcA-iLNU5g236yhp7ie6-dqpxNpG=EMz8tXhOXs9aPnaS+Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-iLNU5g236yhp7ie6-dqpxNpG=EMz8tXhOXs9aPnaS+Q@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] target-alpha: fix subl and s8subl
	indentation
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
X-List-Received-Date: Sun, 16 Mar 2014 08:00:28 -0000

Il 16/03/2014 00:47, Peter Maydell ha scritto:
> On 15 March 2014 18:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Two missing braces, one close and one open, fabulously let the code
>> compile.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  target-alpha/translate.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target-alpha/translate.c b/target-alpha/translate.c
>> index a9ef1a7..e7e319b 100644
>> --- a/target-alpha/translate.c
>> +++ b/target-alpha/translate.c
>> @@ -1927,6 +1927,7 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
>>                      else {
>>                          tcg_gen_neg_i64(cpu_ir[rc], cpu_ir[rb]);
>>                          tcg_gen_ext32s_i64(cpu_ir[rc], cpu_ir[rc]);
>> +                    }
>>                  }
>>              }
>>              break;
>> @@ -1991,7 +1992,7 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
>>                  } else {
>>                      if (islit)
>>                          tcg_gen_movi_i64(cpu_ir[rc], -lit);
>> -                    else
>> +                    else {
>>                          tcg_gen_neg_i64(cpu_ir[rc], cpu_ir[rb]);
>>                          tcg_gen_ext32s_i64(cpu_ir[rc], cpu_ir[rc]);
>>                      }
>
> I'm surprised checkpatch didn't insist you added braces to the "if"
> half of this if-else as well.

I must admit I ignored it.  It makes the patch harder to review, since 
the bug is explicitly about missing (unmatched) braces.  I can add the 
braces throughout the file, but I don't think it's a reason to obfuscate 
this particular patch.

Paolo

