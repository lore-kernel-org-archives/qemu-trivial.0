Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS8X9-0004LZ-Gn
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 13:19:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WS8X6-0004Gt-Mo
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 13:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WS8X5-0004PE-Fh
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 13:19:32 -0400
Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f]:49144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WS8X1-0004NG-RC; Mon, 24 Mar 2014 13:19:28 -0400
Received: by mail-we0-f175.google.com with SMTP id q58so3645621wes.34
	for <multiple recipients>; Mon, 24 Mar 2014 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SKJMmxQ5a3iDqBej4DpkajbsB8DFgS4+r7DIWTDe+0E=;
	b=VoomNOYy+D/I+nGMUN0/J2URrBXkYIZEtJEEOJjd/LX4pS205cO85uwItXzvrgaIJl
	CH9QeQvvScwoqpVFm7nZHKn3inSACg87yFNfCi54xNxclJnFDHZ6UC27xUPEkzRb3XyK
	8kBSCT/0uRrKe+2k1MYjMafJ+xiE4ori3v2/JjfRdeQwaxdD/0jPZJO0GV6XuYc1NOml
	yAJDz7GaJITDZhMsyDHGmsiPGQBjYidPLfL/vik7hHSne7YkjRnQPmqUxq5FYLOp0MVX
	bHdOjIzav5cdfNBn5FVzqQ+KuW5qIOF/pzmUzpVM6RWgo1FsAqOJntl5hvbsRi0Ggo8A
	TkUQ==
MIME-Version: 1.0
X-Received: by 10.180.107.136 with SMTP id hc8mr17540982wib.11.1395681566340; 
	Mon, 24 Mar 2014 10:19:26 -0700 (PDT)
Received: by 10.216.60.143 with HTTP; Mon, 24 Mar 2014 10:19:26 -0700 (PDT)
In-Reply-To: <53305328.6070307@redhat.com>
References: <1395675886-3357-1-git-send-email-prasadjoshi.linux@gmail.com>
	<53305328.6070307@redhat.com>
Date: Mon, 24 Mar 2014 22:49:26 +0530
Message-ID: <CALJbWeo48-NszoaDzo8ADhfFszoWumhJV92Tv7V8fWaqx5Jxqg@mail.gmail.com>
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22f
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
X-List-Received-Date: Mon, 24 Mar 2014 17:19:33 -0000

On Mon, Mar 24, 2014 at 9:15 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 24/03/2014 16:44, Prasad Joshi ha scritto:
>
>> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
>> ---
>>  hw/scsi/spapr_vscsi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
>> index 34478f0..d4ada4f 100644
>> --- a/hw/scsi/spapr_vscsi.c
>> +++ b/hw/scsi/spapr_vscsi.c
>> @@ -690,7 +690,7 @@ static void vscsi_inquiry_no_target(VSCSIState *s,
>> vscsi_req *req)
>>      int rc, len, alen;
>>
>>      /* We dont do EVPD. Also check that page_code is 0 */
>> -    if ((cdb[1] & 0x01) || (cdb[1] & 0x01) || cdb[2] != 0) {
>> +    if ((cdb[1] & 0x01) || cdb[2] != 0) {
>>          /* Send INVALID FIELD IN CDB */
>>          vscsi_makeup_sense(s, req, ILLEGAL_REQUEST, 0x24, 0);
>>          vscsi_send_rsp(s, req, CHECK_CONDITION, 0, 0);
>>
>
> Not trivial---I have no idea if something else was meant to be checked.

Considering the code intends to follow the comment mentioned above if
condition. I think the patch is correct.

Here is reference from SCSI manual.

<manual>
INQUIRY Command
================
EVPD (Enable Vital Product Data) bit
----------------------------------------------
An enable vital product data (EVPD) bit set to one specifies that the
device server shall return the vital product data specified by the
PAGE CODE field (see 3.6.4).

0 ==> If the EVPD bit is set to zero, the device server shall return
the standard INQUIRY data (see 3.6.2). If the PAGE CODE field is not
set to zero when the EVPD bit is set to zero, the command shall be
terminated with CHECK CONDITION status, with the sense key set to
ILLEGAL REQUEST, and the additional sense code set to INVALID FIELD IN
CDB.

1 ==> When the EVPD bit is set to one, the PAGE CODE field specifies
which page of vital product data information the device server shall
return (see 4.4).
</manual>

- According to comment EVPD is not supported. (First part of if condition)
- According to manual if EVPD is 0, PAGE CODE must not be zero. PAGE
CODE is 3rd byte of INQUIRY command (i.e. cmd[2])

Therefore, in my opinion, patch is correct.

Thanks and Regards,
Prasad

>
> Paolo

