Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMggW-0005D0-SU
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 14:11:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMggT-0005Bs-8m
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 14:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMggQ-0001YB-05
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 14:11:29 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:36407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ZMggP-0001Y7-Sw; Tue, 04 Aug 2015 14:11:25 -0400
Received: by qkdv3 with SMTP id v3so6285671qkd.3;
	Tue, 04 Aug 2015 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=MY+BFbuQE2Xh9R+BLZzvP+5llOdTAPHSEh+XHAB8Zc0=;
	b=M5Cxc3SUwFcy5VYtnEV3uvIMdQr5arzs4WAffifOJBxUQCd04Dz+SWgqphpWty/Bfz
	HsvmfyY7ZQHTY7cEeOdh3qUFBp+6H2LiMZPw7rnJN8Uv3i0LuueXW6vXG5OQ5DxugFzA
	QVS5LsXVJvqmptqoiSIYBuioZPsEr4We+l9TcoF3UoyLpdanyEb7pd790vHaoe6goVyy
	VN5+AuGMep9b6Rqo88mcsqEZeQvG57Se5JRq++8Nmjs47/ZspnZiWrf9Q5HEjSMGjGAS
	WgyOOqzbilnSbBe2SvZTy2pN5kNgfjaYs1lBvxUSAebuFxwPtatKW5s4AKlJnh9Tyq/h
	Mitg==
X-Received: by 10.55.41.170 with SMTP id p42mr6422qkp.73.1438711885644;
	Tue, 04 Aug 2015 11:11:25 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	x75sm39089qkx.28.2015.08.04.11.11.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 11:11:25 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-10-git-send-email-alex.bennee@linaro.org>
	<55C0CFB9.3090105@twiddle.net> <87bnenkls0.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <55C1004A.2020300@twiddle.net>
Date: Tue, 4 Aug 2015 11:11:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87bnenkls0.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::22d
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v4 09/11] target-arm: dfilter support for
 in_asm, op, opt_op
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
X-List-Received-Date: Tue, 04 Aug 2015 18:11:31 -0000

On 08/04/2015 10:26 AM, Alex Bennée wrote:
> 
> Richard Henderson <rth@twiddle.net> writes:
> 
>> On 08/03/2015 02:14 AM, Alex Bennée wrote:
>>> Each individual architecture needs to use the qemu_log_in_addr_range()
>>> feature for enabling in_asm and marking blocks for op/opt_op output.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  target-arm/translate-a64.c | 6 ++++--
>>>  target-arm/translate.c     | 6 ++++--
>>>  2 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
>>> index 689f2be..0b0f4ae 100644
>>> --- a/target-arm/translate-a64.c
>>> +++ b/target-arm/translate-a64.c
>>> @@ -11026,7 +11026,8 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
>>>              gen_io_start();
>>>          }
>>>  
>>> -        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT))) {
>>> +        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT) &&
>>> +                     qemu_log_in_addr_range(dc->pc))) {
>>>              tcg_gen_debug_insn_start(dc->pc);
>>>          }
>>
>> If there's more than one or two ranges, it's probably quicker to
>> generate the debug opcode regardless of the range.  Remember, this
>> check is happening once per insn, not once per tb.
> 
> Maybe I should hoist the check up to the start of a block? This would
> mean we would dump all instructions in a block even if they went past
> the end-point but the reverse case is probably just confusing.
> 
> We'll still not dump anything that starts outside the range.

Why hoist when the loglevel_mask check is so quick?
Processing of these debug opcodes is equally quick.

It's really only the dumping of the opcodes elsewhere
that needs to check the addr_range.


r~

