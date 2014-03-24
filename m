Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS916-0004HM-6n
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 13:50:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WS90v-0003qR-Ro
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 13:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WS90n-0006op-EX
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 13:50:21 -0400
Received: from mail-qa0-x231.google.com ([2607:f8b0:400d:c00::231]:50726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WS90n-0006oY-Af; Mon, 24 Mar 2014 13:50:13 -0400
Received: by mail-qa0-f49.google.com with SMTP id j7so5595400qaq.8
	for <multiple recipients>; Mon, 24 Mar 2014 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1jQ9xNBnbkFax3iHTG6MnAax4IkvVv0X5701JLsUq1Q=;
	b=HlTRRazhbkrF9xsT9MQeX0luxGWAAyBWiDgswPYA2KI0E6tTRcgUi5rJMsRDQIVXO7
	Rcw7GcQDJCOCz79z4fQAw1dobGTiZ+iTFhBs6cL6I20esnFTK/O6IbtdLhbKiV+ULHeG
	gCckEr0e9Apw0R7lVhfpRhqXo0KPqS1ql8f+E+SPdiPY7uu+kqIQs4oOCKgCRXMufM/o
	+y51U2zJRZd9UPUlU1oCHeQRvb1YPjIdD9kxN4wHW54wF+bN9A7mYn7qL2/M2EGydXvO
	j3H4BXHqbSfRiHMVohLB8tApOx8+p+I+Vsd8uxEkmmYSTOVvjVqzxUKZDJtoEKaOGfeg
	lSrg==
X-Received: by 10.224.38.209 with SMTP id c17mr77250515qae.11.1395683411956;
	Mon, 24 Mar 2014 10:50:11 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-156-129.cust.vodafonedsl.it. [37.117.156.129])
	by mx.google.com with ESMTPSA id v3sm27441198qaj.1.2014.03.24.10.50.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Mar 2014 10:50:10 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5330704F.8030903@redhat.com>
Date: Mon, 24 Mar 2014 18:50:07 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
References: <1395675886-3357-1-git-send-email-prasadjoshi.linux@gmail.com>	<53305328.6070307@redhat.com>
	<CALJbWeo48-NszoaDzo8ADhfFszoWumhJV92Tv7V8fWaqx5Jxqg@mail.gmail.com>
In-Reply-To: <CALJbWeo48-NszoaDzo8ADhfFszoWumhJV92Tv7V8fWaqx5Jxqg@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	agraf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] spapr_vscsi: remove duplicate condition
	check
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
X-List-Received-Date: Mon, 24 Mar 2014 17:50:31 -0000

Il 24/03/2014 18:19, Prasad Joshi ha scritto:
> On Mon, Mar 24, 2014 at 9:15 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Il 24/03/2014 16:44, Prasad Joshi ha scritto:
>>
>>> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
>>> ---
>>>  hw/scsi/spapr_vscsi.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
>>> index 34478f0..d4ada4f 100644
>>> --- a/hw/scsi/spapr_vscsi.c
>>> +++ b/hw/scsi/spapr_vscsi.c
>>> @@ -690,7 +690,7 @@ static void vscsi_inquiry_no_target(VSCSIState *s,
>>> vscsi_req *req)
>>>      int rc, len, alen;
>>>
>>>      /* We dont do EVPD. Also check that page_code is 0 */
>>> -    if ((cdb[1] & 0x01) || (cdb[1] & 0x01) || cdb[2] != 0) {
>>> +    if ((cdb[1] & 0x01) || cdb[2] != 0) {
>>>          /* Send INVALID FIELD IN CDB */
>>>          vscsi_makeup_sense(s, req, ILLEGAL_REQUEST, 0x24, 0);
>>>          vscsi_send_rsp(s, req, CHECK_CONDITION, 0, 0);
>>>
>>
>> Not trivial---I have no idea if something else was meant to be checked.
>
> Considering the code intends to follow the comment mentioned above if
> condition. I think the patch is correct.
>
> Here is reference from SCSI manual.
>
> <manual>
> INQUIRY Command
> ================
> EVPD (Enable Vital Product Data) bit
> ----------------------------------------------
> An enable vital product data (EVPD) bit set to one specifies that the
> device server shall return the vital product data specified by the
> PAGE CODE field (see 3.6.4).
>
> 0 ==> If the EVPD bit is set to zero, the device server shall return
> the standard INQUIRY data (see 3.6.2). If the PAGE CODE field is not
> set to zero when the EVPD bit is set to zero, the command shall be
> terminated with CHECK CONDITION status, with the sense key set to
> ILLEGAL REQUEST, and the additional sense code set to INVALID FIELD IN
> CDB.
>
> 1 ==> When the EVPD bit is set to one, the PAGE CODE field specifies
> which page of vital product data information the device server shall
> return (see 4.4).
> </manual>
>
> - According to comment EVPD is not supported. (First part of if condition)
> - According to manual if EVPD is 0, PAGE CODE must not be zero. PAGE
> CODE is 3rd byte of INQUIRY command (i.e. cmd[2])

More important, there's no other field in the CDB that matters (except 
for an obsolete on in byte 1/bit 1).

Applied to scsi-next branch, thanks.

Paolo


