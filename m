Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymjmh-0008GP-J0
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 10:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Ymjmf-0008DO-2k
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Ymjmb-0002Mz-Eu
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:13:17 -0400
Received: from mail-qc0-f181.google.com ([209.85.216.181]:33752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Ymjmb-0002M2-Be
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:13:13 -0400
Received: by qcrf4 with SMTP id f4so55420416qcr.0
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 07:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=JqtZZx7vJXHI4+omMSy6OU0xOFsLhKfvmblkisQkoq0=;
	b=C4vJ0uZuNBps/WzGZodsTiTGTyaFPp8nUH0rpKxYpVz7R1Rg4f/xsrrWCdZjZP3Ru1
	Zw9rA/7vm8NU1oXojkno650OempOSyCdW0cpXq2/yLVzaTCxful+uQVJzuZHF578wXjS
	ZIWUHAq2ccp4jc5PZPeY+M2oG5m57dgdmALncmQSnHK/q+FfJnyDlxTQRkxT4T9E05Ho
	E8/av6neljePXvmgW1vo3aQl3Kadf12Klvxry/lMqwW9oMKV1ZmtiE2MGs7lI7D63ODe
	Mundh00dBK2qOf6abfosSa63rZ7VQ6ZLek1Wh4rhtWcejekg51BlC70TGhYp0OQoKWK6
	zlKg==
X-Gm-Message-State: ALoCoQmxQz4C4iZQlpN7vh+fZyjIT8S4cVu21BfcOrMabgU7w9+eVOvPVLFYRItFFRDcQ6Xvyhr6
MIME-Version: 1.0
X-Received: by 10.55.20.215 with SMTP id 84mr12307070qku.51.1430143992880;
	Mon, 27 Apr 2015 07:13:12 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.97.41 with HTTP; Mon, 27 Apr 2015 07:13:12 -0700 (PDT)
In-Reply-To: <553E3C79.6020702@msgid.tls.msk.ru>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
	<1430075424-25975-6-git-send-email-crosthwaite.peter@gmail.com>
	<20150427092838.GE17116@toto> <553E3C79.6020702@msgid.tls.msk.ru>
Date: Mon, 27 Apr 2015 07:13:12 -0700
X-Google-Sender-Auth: bUBgrzNHv92REDmTNj8dIZaiLLU
Message-ID: <CAEgOgz41gOOWioAOEZ1j_xKz6goB9HHfq7e_jggfLRXyHTWrKg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.181
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH microblaze v1 5/6] mb: cpu:
	Delete EXCP_NMI
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
X-List-Received-Date: Mon, 27 Apr 2015 14:13:18 -0000

On Mon, Apr 27, 2015 at 6:41 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 27.04.2015 12:28, Edgar E. Iglesias wrote:
>> On Sun, Apr 26, 2015 at 12:10:23PM -0700, Peter Crosthwaite wrote:
>>> This define is unused. Remove.
>>>
>>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>
>> Hi,
>>
>> Any reason not to shift down the numbering?

None. Although my goal was to make no code change in the trivial patch series.

>>
>> Otherwise the whole series looks good to me.
>
> What does this mean, "looks good", is it your R-b? :)
>
>>> @@ -36,7 +36,6 @@ typedef struct CPUMBState CPUMBState;
>>>
>>>  #define ELF_MACHINE EM_MICROBLAZE
>>>
>>> -#define EXCP_NMI        1
>>>  #define EXCP_MMU        2
>>>  #define EXCP_IRQ        3
>>>  #define EXCP_BREAK      4
>
> I can renumber this on commit just fine, there's no need
> to resend whole thing, is it okay with you Peter?
>

It's ok with me. Thanks.

Regards,
Peter

> Thanks,
>
> /mjt
>

