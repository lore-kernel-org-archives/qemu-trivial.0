Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyRa-0007a4-J3
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 17:07:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyRX-0007Zn-Tw
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:07:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyRW-0002vf-5b
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:06:59 -0400
Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232]:59823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyRV-0002vM-VO
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:06:58 -0400
Received: by mail-la0-f50.google.com with SMTP id ed20so717729lab.23
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2013 14:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=leIMfaxhFk7yAVShobEcnwFlqVCgysw1PumBHuIv3iw=;
	b=m04lXyPOieNe1G4dqTXK7qmPo75Jb5T+ZcbPYgJaguGcsfxAxoZYuXAlrGDzQmJCxE
	jWJHGCWLhwU8/aJuJ3M409eyQBsVBCePFLEylYBNGmcHGjGBdHH8H1n8uCYYRjGAJApJ
	j91NPXKy5COCeL7UyVdhRjpMjn7Asq1Sqvf76fSqGQjtMrHbY+ePAZda9YkS44nE/UKu
	THe436VFPSKwvACxP0FyeUVyqL9CZLwJexJ2WmLYrTwSSww586+FObypQ4Yf/Ptj6mPq
	LUHPhZQfWqolfSohzjQbPrC2uZzJg63vEFwvlzdZjorrAvuHPVHurJ3bVLUWkjwrazi9
	bnJw==
X-Received: by 10.112.35.69 with SMTP id f5mr13421434lbj.105.1370380016370;
	Tue, 04 Jun 2013 14:06:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Tue, 4 Jun 2013 14:06:36 -0700 (PDT)
In-Reply-To: <1370377419-31788-4-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-4-git-send-email-alevy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jun 2013 22:06:36 +0100
Message-ID: <CAFEAcA-caAs484EOvRKO=kCC3P_6OPZkZn5R8W+AtnHofLW1EQ@mail.gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn096vuBNXurwGcP/NwmCQTnl4fsSH/9jZaUWlFchrZ54rZJitBo9a8EKn8z8oDRAvy6Oou
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::232
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/5] libcacard/vreader.c:
	fix possible NULL dereference
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
X-List-Received-Date: Tue, 04 Jun 2013 21:07:01 -0000

On 4 June 2013 21:23, Alon Levy <alevy@redhat.com> wrote:
> Reported by Coverity:
>
> Error: FORWARD_NULL (CWE-476):
> qemu-1.5.0/libcacard/vreader.c:267: cond_false: Condition "card == NULL", taking false branch
> qemu-1.5.0/libcacard/vreader.c:269: if_end: End of if statement
> qemu-1.5.0/libcacard/vreader.c:272: cond_false: Condition "apdu == NULL", taking false branch
> qemu-1.5.0/libcacard/vreader.c:275: else_branch: Reached else branch
> qemu-1.5.0/libcacard/vreader.c:280: cond_false: Condition "response", taking false branch
> qemu-1.5.0/libcacard/vreader.c:284: if_end: End of if statement
> qemu-1.5.0/libcacard/vreader.c:280: var_compare_op: Comparing "response" to null implies that "response" might be null.
> qemu-1.5.0/libcacard/vreader.c:286: cond_true: Condition "card_status == VCARD_DONE", taking true branch
> qemu-1.5.0/libcacard/vreader.c:287: cond_true: Condition "card_status == VCARD_DONE", taking true branch
> qemu-1.5.0/libcacard/vreader.c:288: var_deref_op: Dereferencing null pointer "response".
>
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  libcacard/vreader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libcacard/vreader.c b/libcacard/vreader.c
> index 5793d73..60eb43b 100644
> --- a/libcacard/vreader.c
> +++ b/libcacard/vreader.c
> @@ -260,7 +260,7 @@ vreader_xfr_bytes(VReader *reader,
>  {
>      VCardAPDU *apdu;
>      VCardResponse *response = NULL;
> -    VCardStatus card_status;
> +    VCardStatus card_status = VCARD_FAIL;
>      unsigned short status;
>      VCard *card = vreader_get_card(reader);
>

This doesn't make any sense to me as a fix for the quoted coverity
issue. It's complaining because the function both checks
that response isn't NULL (line 280) and uses it without
checking (line 288). If your change makes it stop complaining
it's only because you've managed to confuse it.

You either need to:
 * assume that vcard_make_response() and vcard_process_apdu()
   both guarantee to set response to non-NULL, and drop the
   "if (response)" check
 * don't assume it, and handle NULL response consistently
   in this function (eg by changing the line 287 check to
   "if (card_status == VCARD_DONE && response)"
 * take some middle line, eg "response is guaranteed not to
   be NULL if and only if status is VCARD_DONE" and then
   consistently check card_status in both places.

Also, this sequence:
    assert(card_status == VCARD_DONE);
    if (card_status == VCARD_DONE) {

is nonsensical. Either we should assert that the status
is always DONE, or we have code to handle the DONE and not
DONE cases; not both.

thanks
-- PMM

