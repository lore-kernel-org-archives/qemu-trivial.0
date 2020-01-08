Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipAj7-0006iw-E4
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 07:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ipAj2-0006Zs-Vk
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 07:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ipAj1-0004ok-Il
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 07:46:16 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23548
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ipAj1-0004oG-Da
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 07:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578487574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIiMM6Pf4/QASnshpSy0W4cEb84s+FeC+lukYms/+NQ=;
 b=NEFJKich9QcEwk6syRuh8oSEIWekdJXAmsB8qz6JZcpvAQWa5aSVxdE5UD23mdTaXPsOno
 Cd0K/aK1cO6iLWxokM1CLei4+lnLQ2iUvMDu+qwB4tvHyXbUy9Zh0fmD3H5beGMgprupY5
 +JgNma97eDYdJJcXxZU49Koyc4B19F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-fzbetnrYOUCRm0uHMNpk2w-1; Wed, 08 Jan 2020 07:46:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E15593A1;
 Wed,  8 Jan 2020 12:46:12 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A35519C58;
 Wed,  8 Jan 2020 12:46:11 +0000 (UTC)
Date: Wed, 8 Jan 2020 13:46:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v1 37/59] s390x/event-facility.c: remove unneeded labels
Message-ID: <20200108134608.17c8c76c.cohuck@redhat.com>
In-Reply-To: <20200106182425.20312-38-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-38-danielhb413@gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: fzbetnrYOUCRm0uHMNpk2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2020 12:46:19 -0000

On Mon,  6 Jan 2020 15:24:03 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 'out' label from write_event_mask(), handle_sccb_read_events()
> and write_event_data() can be replaced by 'return'.
> 
> CC: Cornelia Huck <cohuck@redhat.com>
> CC: Halil Pasic <pasic@linux.ibm.com>
> CC: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/s390x/event-facility.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
> index 6afe278cad..f3b9661f32 100644
> --- a/hw/s390x/event-facility.c
> +++ b/hw/s390x/event-facility.c
> @@ -182,11 +182,11 @@ static void write_event_data(SCLPEventFacility *ef, SCCB *sccb)
>  {
>      if (sccb->h.function_code != SCLP_FC_NORMAL_WRITE) {
>          sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_FUNCTION);
> -        goto out;
> +        return;
>      }
>      if (be16_to_cpu(sccb->h.length) < 8) {
>          sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
> -        goto out;
> +        return;
>      }
>      /* first do a sanity check of the write events */
>      sccb->h.response_code = cpu_to_be16(write_event_length_check(sccb));
> @@ -196,9 +196,6 @@ static void write_event_data(SCLPEventFacility *ef, SCCB *sccb)
>          sccb->h.response_code =
>                  cpu_to_be16(handle_sccb_write_events(ef, sccb));
>      }
> -
> -out:
> -    return;
>  }

I'm fine with the changes to write_event_data().

>  
>  static uint16_t handle_sccb_read_events(SCLPEventFacility *ef, SCCB *sccb,
> @@ -262,7 +259,7 @@ static void read_event_data(SCLPEventFacility *ef, SCCB *sccb)
>  
>      if (be16_to_cpu(sccb->h.length) != SCCB_SIZE) {
>          sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
> -        goto out;
> +        return;
>      }
>  
>      sclp_cp_receive_mask = ef->receive_mask;
> @@ -280,18 +277,15 @@ static void read_event_data(SCLPEventFacility *ef, SCCB *sccb)
>              (sclp_active_selection_mask & ~sclp_cp_receive_mask)) {
>              sccb->h.response_code =
>                      cpu_to_be16(SCLP_RC_INVALID_SELECTION_MASK);
> -            goto out;
> +            return;
>          }
>          break;
>      default:
>          sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_FUNCTION);
> -        goto out;
> +        return;
>      }
>      sccb->h.response_code = cpu_to_be16(
>              handle_sccb_read_events(ef, sccb, sclp_active_selection_mask));
> -
> -out:
> -    return;
>  }

I think read_event_data() is still a bit confusing, even if we get rid
of the 'out:' label, as the flow remains the same. How about something
like the following, which makes it clear that we handle the sccb events
for unconditional read and for a selective read with a valid mask:

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index 6afe278cad15..877721d6601e 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -262,17 +262,17 @@ static void read_event_data(SCLPEventFacility *ef, SCCB *sccb)
 
     if (be16_to_cpu(sccb->h.length) != SCCB_SIZE) {
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
-        goto out;
+        return;
     }
 
-    sclp_cp_receive_mask = ef->receive_mask;
-
-    /* get active selection mask */
     switch (sccb->h.function_code) {
     case SCLP_UNCONDITIONAL_READ:
-        sclp_active_selection_mask = sclp_cp_receive_mask;
+        sccb->h.response_code = cpu_to_be16(
+            handle_sccb_read_events(ef, sccb, ef->receive_mask));
         break;
     case SCLP_SELECTIVE_READ:
+        sclp_cp_receive_mask = ef->receive_mask;
+        /* get active selection mask */
         copy_mask((uint8_t *)&sclp_active_selection_mask, (uint8_t *)&red->mask,
                   sizeof(sclp_active_selection_mask), ef->mask_length);
         sclp_active_selection_mask = be64_to_cpu(sclp_active_selection_mask);
@@ -280,18 +280,14 @@ static void read_event_data(SCLPEventFacility *ef, SCCB *sccb)
             (sclp_active_selection_mask & ~sclp_cp_receive_mask)) {
             sccb->h.response_code =
                     cpu_to_be16(SCLP_RC_INVALID_SELECTION_MASK);
-            goto out;
+        } else {
+            sccb->h.response_code = cpu_to_be16(
+                handle_sccb_read_events(ef, sccb, sclp_active_selection_mask));
         }
         break;
     default:
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_FUNCTION);
-        goto out;
     }
-    sccb->h.response_code = cpu_to_be16(
-            handle_sccb_read_events(ef, sccb, sclp_active_selection_mask));
-
-out:
-    return;
 }
 
 static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)


>  
>  static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
> @@ -303,7 +297,7 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
>      if (!mask_length || (mask_length > SCLP_EVENT_MASK_LEN_MAX) ||
>          ((mask_length != 4) && !ef->allow_all_mask_sizes)) {
>          sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_MASK_LENGTH);
> -        goto out;
> +        return;
>      }
>  
>      /*
> @@ -328,9 +322,6 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
>  
>      sccb->h.response_code = cpu_to_be16(SCLP_RC_NORMAL_COMPLETION);
>      ef->mask_length = mask_length;
> -
> -out:
> -    return;
>  }
>  
>  /* qemu object creation and initialization functions */

The changes to write_event_mask() look fine to me as well.


