Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UwDuw-0002pR-Np
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jul 2013 12:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <corentin.chary@gmail.com>) id 1UwD9O-0004gy-9O
	for qemu-trivial@nongnu.org; Mon, 08 Jul 2013 11:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <corentin.chary@gmail.com>) id 1UwD9J-0006MH-OI
	for qemu-trivial@nongnu.org; Mon, 08 Jul 2013 11:14:50 -0400
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:35297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <corentin.chary@gmail.com>)
	id 1UwD98-0006KI-LO; Mon, 08 Jul 2013 11:14:34 -0400
Received: by mail-wi0-f171.google.com with SMTP id hj3so9149529wib.10
	for <multiple recipients>; Mon, 08 Jul 2013 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=iiwoPPtmqEQcYPd7RfNZjgfPt02KsvsfQ9OPdkjZoEk=;
	b=E0FvYJzSQOOEDi69Q6gMjshd89xBOWHBuD9mMxFF6+C/GrVUmyXe6PsFsFP4RbAkJT
	CBNEdhqV+ABLbxa//uVnucTt1/2wHB4SPMIYqcjPe6/92/yi6hAxA5HZAQieSwfkG1wT
	n3S6sLMKADF1wSqpIPWK11lP5snc4t65sEIMPyuJmOm+FQHRnqy2DeEO8hDns7GiwH8o
	1cfA4ZRv5pL1X87nraaEdZYG+RcIAKekiYCb+PdJJ3VRbRUuOyTX4iOjg1TpLF5CfTMP
	ZbXB0pvW4Z7oPjjgw/NZpZTdVLhyfeZ6Tgi16u9br/pVH3XBoroV2wb84IXy58cvt+xH
	aL+g==
MIME-Version: 1.0
X-Received: by 10.194.219.198 with SMTP id pq6mr12583654wjc.58.1373296473366; 
	Mon, 08 Jul 2013 08:14:33 -0700 (PDT)
Sender: corentin.chary@gmail.com
Received: by 10.194.242.67 with HTTP; Mon, 8 Jul 2013 08:14:33 -0700 (PDT)
In-Reply-To: <51DA438A.8060903@weilnetz.de>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
	<037D60EF2A5746E468BF0A04@nimrod.local>
	<CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>
	<51DA438A.8060903@weilnetz.de>
Date: Mon, 8 Jul 2013 16:14:33 +0100
X-Google-Sender-Auth: mIegBLhc4m5MqsdTSEV6gGEpYSA
Message-ID: <CAHR064g-jOt7XaY4G9a7MZRs_qd9REnyyGn8D=mrRoY+J-bXUA@mail.gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
X-Mailman-Approved-At: Mon, 08 Jul 2013 12:03:57 -0400
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Qemu-development List <qemu-devel@nongnu.org>,
	Alex Bligh <alex@alex.org.uk>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes
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
X-List-Received-Date: Mon, 08 Jul 2013 15:14:54 -0000

The comments (and most of the code) are from libvncserver (and,
earlier, from "THE 'ZYWRLE' VNC CODEC SOURCE CODE. " as described in
the header):

http://fastdroid-vnc.googlecode.com/svn-history/r3/trunk/LibVNCServer-0.9.7/libvncserver/zywrletemplate.c

On Mon, Jul 8, 2013 at 5:43 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Am 08.07.2013 00:32, schrieb Peter Maydell:
>> On 7 July 2013 23:05, Alex Bligh <alex@alex.org.uk> wrote:
>>>
>>> --On 7 July 2013 22:25:02 +0200 Stefan Weil <sw@weilnetz.de> wrote:
>>>
>>>> --- a/ui/vnc-enc-zywrle.h
>>>> +++ b/ui/vnc-enc-zywrle.h
>>>> @@ -305,9 +305,9 @@ static inline void harr(int8_t *px0, int8_t *px1)
>>>>     |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
>>>>
>>>>   In this method, H/L and X0/X1 is always same position.
>>>> - This lead us to more speed and less memory.
>>>> - Of cause, the result of both method is quite same
>>>> - because it's only difference that coefficient position.
>>>> + This leads us to more speed and less memory.
>>>> + Of course, the result of both methods is quite same
>>>> + because its only difference is that coefficient position.
>>>>  */
>>>>  static inline void wavelet_level(int *data, int size, int l, int
>>>> skip_pixel)  {
>>>
>>> If we're doing spelling/grammar fixes, that should be "is quite the same"
>>> and "that of coefficient position".
>> "is quite the same" isn't idiomatic English either. I can't
>> tell if the author meant "is quite similar" or "is exactly
>> the same", so we probably shouldn't change the text unless
>> we can work out which one is right...
>>
>> -- PMM
>
> Thank you for both answers. Even as non native speaker
> I was aware that this part still did not sound like correct English,
> but I restricted my modifications to those parts where I was sure.
>
> Let's ask the original author Corentin Chary...
>
> Regards
> Stefan W.
>



-- 
Corentin Chary
http://xf.iksaif.net

