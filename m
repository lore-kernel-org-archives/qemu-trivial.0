Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSlrw-00049Z-V9
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 05:42:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TSlru-00049S-4q
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TSlro-0002q0-91
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:42:50 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:44230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TSlro-0002pp-3v
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:42:44 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so6533135iea.4
	for <qemu-trivial@nongnu.org>; Mon, 29 Oct 2012 02:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=VWmWrvyMmPlvnf+Qq1qIegc0WuHD67s3c0FTzI78xNs=;
	b=eviqKxwM7qDaCTtTnRLG4A5ZCjHIfeVwVMXDMJ6sKAz9t/IfMnM9em43FqqUwUYgdU
	Cum1/MCc/ds3e7qI7ZPyfI+Bwv2kzra+6qL2BfIJ60hPHD0TrHNnG43nxSRAUAMdpca4
	bV3T71DgkGVdvhvH6DebxMwEt1qKkREVgBmshYunSjtAP3XZgqPu6mAxRhcCqThigNNp
	A1Xvs7ZzSmiHuWR7Iv9H8vXtVwplbZXP1ZAV21qEK1e/cbK5bZhsgnHgmZE1pfednz4G
	GAPv1gZTfbnpomrsnDi4aeNTIJyVecMOU4ER7SAhw0jWji8vQmgjhDi3utwVLg6YCJhI
	FcVQ==
MIME-Version: 1.0
Received: by 10.50.152.137 with SMTP id uy9mr8690904igb.62.1351503763586; Mon,
	29 Oct 2012 02:42:43 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Mon, 29 Oct 2012 02:42:43 -0700 (PDT)
In-Reply-To: <CAFEAcA8R+J+DeN7V_6bVHhh3kYprA8EKWJXEzfDp7iWjWzYLqQ@mail.gmail.com>
References: <1330121921-23462-1-git-send-email-meadori@codesourcery.com>
	<4F4814F7.6040008@suse.de> <4F71D7AD.8080103@codesourcery.com>
	<CAFEAcA8R+J+DeN7V_6bVHhh3kYprA8EKWJXEzfDp7iWjWzYLqQ@mail.gmail.com>
Date: Mon, 29 Oct 2012 09:42:43 +0000
Message-ID: <CAFEAcA9WH_jrHGns6dEKa4F9TaQXR8FEWJ27rmNY+0yQ+MJepQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Meador Inge <meadori@codesourcery.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmCxo36P7WjCDmUNEQj7Sa3kgYTZewD8rf+8GN+kiWhLyaCVa0WTE2ylEA50qZzS/kzlFRI
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paul Brook <paul@codesourcery.com>,
	qemu-devel@nongnu.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] m68k: Return
	semihosting errno values correctly
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
X-List-Received-Date: Mon, 29 Oct 2012 09:42:51 -0000

I just noticed this patch never got applied by anybody
(and alas it now needs a refresh because the file was renamed
in the interim.)

-- PMM

On 27 March 2012 16:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patch is simple enough (and m68k unmaintained enough)
> that it could reasonably go through qemu-trivial I think.
>
> -- PMM
>
> On 27 March 2012 16:07, Meador Inge <meadori@codesourcery.com> wrote:
>> Ping.
>>
>> On 02/24/2012 04:53 PM, Andreas F=C3=A4rber wrote:
>>> Am 24.02.2012 23:18, schrieb Meador Inge:
>>>> Fixing a simple typo, s/errno/err/, that caused
>>>> the error status from GDB semihosted system calls
>>>> to be returned incorrectly.
>>>>
>>>> Signed-off-by: Meador Inge <meadori@codesourcery.com>
>>>
>>> Nice catch!
>>>
>>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>
>>> Andreas
>>>
>>>> ---
>>>>  m68k-semi.c |    2 +-
>>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/m68k-semi.c b/m68k-semi.c
>>>> index bab01ee..6d60ced 100644
>>>> --- a/m68k-semi.c
>>>> +++ b/m68k-semi.c
>>>> @@ -150,7 +150,7 @@ static void m68k_semi_cb(CPUState *env, target_ulo=
ng ret, target_ulong err)
>>>>      }
>>>>      /* FIXME - handle put_user() failure */
>>>>      put_user_u32(ret, args);
>>>> -    put_user_u32(errno, args + 4);
>>>> +    put_user_u32(err, args + 4);
>>>>  }
>>>>
>>>>  #define ARG(n)                                      \
>>>
>>
>>
>> --
>> Meador Inge
>> CodeSourcery / Mentor Embedded
>> http://www.mentor.com/embedded-software
>>

