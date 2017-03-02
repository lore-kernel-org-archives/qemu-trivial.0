Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjX2v-0004b0-B8
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:09:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjX2s-0004Y1-3j
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:09:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjX2r-0002CS-87
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:09:50 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:38271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjX2r-0002B4-2D
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:09:49 -0500
Received: by mail-wm0-x22a.google.com with SMTP id t193so403211wmt.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 12:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pxh7MotX0eXL8YWymUnlUX3bRsqAgJp1b0eSUUNXjPg=;
	b=KYVT1t/xPOZRJPfpDBItVbTmWf7AeneOaS+zJJZ9/+NcvZq+O4/G1gIYtang+ooF3T
	o3kVolxyf38HUacApnaHOq8rqlBjAlkgV7jCfjGMQJ52Z9KwHe5MOotaSThH8e3TJ3jv
	BB/QfBxxooBLFRqpd1t37PV1NE09SJqPqR2AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pxh7MotX0eXL8YWymUnlUX3bRsqAgJp1b0eSUUNXjPg=;
	b=fl7APxrx7vOG5NdR4j5Do863ihis98x4dJgZGey1GR/8k8GxJgfNX+5+G1O6ln1jlX
	J82/v1L8YrFZ3uiOKmjostwvsRaGXIzq4ILTH1KTmcPx3MGFEYGzQ5r+rwgktRMPNEpc
	o4lI0PxnuVpRhLqx9M7bnCB7H3ZUG2gns+jPX2B1tiWxVw1QO2ACmyo2R/qb92cFuLRx
	OjGdVZ5gwh43nIRIVjP12pcg9imdTsQRKttmVfD+n5AVQMPucVf1hATcWW30wol8BBYK
	OQK0aVjaQaWMm8wQ+dzL0fqAhbf5dVKIAoLy7slCH69Hy/PsjyHdlJc9x39TrEUTzXB2
	INQw==
X-Gm-Message-State: AMke39m9+VpObsjJIYwKFEkRpoH0Qofeaj4YUeWT1YFWxttBg772xqRXEeYqCyPk7lCQ1DAlEmDEDka9SKZIZ5Zn
X-Received: by 10.28.55.199 with SMTP id e190mr52182wma.92.1488485388082; Thu,
	02 Mar 2017 12:09:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 12:09:27 -0800 (PST)
In-Reply-To: <CAFEAcA8dP-Z_srttBZSOOONkXGSka-vXrDdVbPGR64Q+Ko=ooA@mail.gmail.com>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<e160b509a76bcf00d1af4665e26c6870eb363cab.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA8dP-Z_srttBZSOOONkXGSka-vXrDdVbPGR64Q+Ko=ooA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 20:09:27 +0000
Message-ID: <CAFEAcA_UCiFXy-RyMdduiRhXg4f5m6M=AcR2Uvr_r7=f37zUeg@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 06/14] sm501: Add missing
 arbitration control register
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
X-List-Received-Date: Thu, 02 Mar 2017 20:09:51 -0000

On 2 March 2017 at 20:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 December 2016 at 15:32, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/display/sm501.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>> index d9219bd..b977094 100644
>> --- a/hw/display/sm501.c
>> +++ b/hw/display/sm501.c
>> @@ -477,6 +477,7 @@ typedef struct SM501State {
>>      uint32_t gpio_31_0_control;
>>      uint32_t gpio_63_32_control;
>>      uint32_t dram_control;
>> +    uint32_t arbitration_control;
>>      uint32_t irq_mask;
>>      uint32_t misc_timing;
>>      uint32_t power_mode_control;
>> @@ -760,6 +761,9 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
>>      case SM501_DRAM_CONTROL:
>>          ret = (s->dram_control & 0x07F107C0) | s->local_mem_size_index << 13;
>>          break;
>> +    case SM501_ARBTRTN_CONTROL:
>> +        ret = s->arbitration_control;
>> +        break;
>>      case SM501_IRQ_MASK:
>>          ret = s->irq_mask;
>>          break;
>> @@ -812,6 +816,9 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
>>          /* TODO : check validity of size change */
>>          s->dram_control |=  value & 0x7FFFFFC3;
>>          break;
>> +    case SM501_ARBTRTN_CONTROL:
>> +        s->arbitration_control =  value & 0x37777777;
>> +        break;
>>      case SM501_IRQ_MASK:
>>          s->irq_mask = value;
>>          break;
>> --
>> 2.7.4
>
> Applied, thanks.

Doh, wrong canned-email-reply template! I meant

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

