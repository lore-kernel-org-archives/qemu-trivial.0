Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WsxUV-00089v-1Q
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 12:59:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WsxUK-0007wV-3c
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 12:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WsxUB-0004lo-25
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 12:59:32 -0400
Received: from oxygen.pond.sub.org ([2a01:4f8:201:233:1::3]:57154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1WsxTs-0004MB-40; Fri, 06 Jun 2014 12:59:04 -0400
Received: from blackfin.pond.sub.org (p5B328A66.dip0.t-ipconnect.de
	[91.50.138.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 09B9D25D39;
	Fri,  6 Jun 2014 18:59:03 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 43AA530403AF; Fri,  6 Jun 2014 18:59:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1402072328-6871-1-git-send-email-armbru@redhat.com>
	<5391EEDA.7030207@redhat.com>
Date: Fri, 06 Jun 2014 18:59:02 +0200
In-Reply-To: <5391EEDA.7030207@redhat.com> (Paolo Bonzini's message of "Fri,
	06 Jun 2014 18:39:54 +0200")
Message-ID: <87fvjidlex.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:201:233:1::3
Cc: qemu-trivial@nongnu.org, alevy@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: Drop superfluous
	conditionals around g_free()
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
X-List-Received-Date: Fri, 06 Jun 2014 16:59:41 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 06/06/2014 18:32, Markus Armbruster ha scritto:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  libcacard/cac.c            | 14 ++++----------
>>  libcacard/card_7816.c      | 12 +++---------
>>  libcacard/vcard.c          | 10 +++-------
>>  libcacard/vcard_emul_nss.c |  4 +---
>>  libcacard/vreader.c        |  4 +---
>>  5 files changed, 12 insertions(+), 32 deletions(-)
>>
>> diff --git a/libcacard/cac.c b/libcacard/cac.c
>> index 0a0163d..ae8c378 100644
>> --- a/libcacard/cac.c
>> +++ b/libcacard/cac.c
>> @@ -100,10 +100,8 @@ cac_applet_pki_reset(VCard *card, int channel)
>>      pki_applet = &(applet_private->u.pki_data);
>>
>>      pki_applet->cert_buffer = NULL;
>> -    if (pki_applet->sign_buffer) {
>> -        g_free(pki_applet->sign_buffer);
>> -        pki_applet->sign_buffer = NULL;
>> -    }
>> +    g_free(pki_applet->sign_buffer);
>> +    pki_applet->sign_buffer = NULL;
>>      pki_applet->cert_buffer_len = 0;
>>      pki_applet->sign_buffer_len = 0;
>>      return VCARD_DONE;
>> @@ -285,12 +283,8 @@ cac_delete_pki_applet_private(VCardAppletPrivate *applet_private)
>>          return;
>>      }
>>      pki_applet_data = &(applet_private->u.pki_data);
>> -    if (pki_applet_data->cert != NULL) {
>> -        g_free(pki_applet_data->cert);
>> -    }
>> -    if (pki_applet_data->sign_buffer != NULL) {
>> -        g_free(pki_applet_data->sign_buffer);
>> -    }
>> +    g_free(pki_applet_data->cert);
>> +    g_free(pki_applet_data->sign_buffer);
>>      if (pki_applet_data->key != NULL) {
>>          vcard_emul_delete_key(pki_applet_data->key);
>>      }
>> diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
>> index a54f880..814fa16 100644
>> --- a/libcacard/card_7816.c
>> +++ b/libcacard/card_7816.c
>> @@ -172,16 +172,12 @@ vcard_response_delete(VCardResponse *response)
>>      switch (response->b_type) {
>>      case VCARD_MALLOC:
>>          /* everything was malloc'ed */
>> -        if (response->b_data) {
>> -            g_free(response->b_data);
>> -        }
>> +        g_free(response->b_data);
>>          g_free(response);
>>          break;
>>      case VCARD_MALLOC_DATA:
>>          /* only the data buffer was malloc'ed */
>> -        if (response->b_data) {
>> -            g_free(response->b_data);
>> -        }
>> +        g_free(response->b_data);
>>          break;
>>      case VCARD_MALLOC_STRUCT:
>>          /* only the structure was malloc'ed */
>> @@ -358,9 +354,7 @@ vcard_apdu_delete(VCardAPDU *apdu)
>>      if (apdu == NULL) {
>>          return;
>>      }
>> -    if (apdu->a_data) {
>> -        g_free(apdu->a_data);
>> -    }
>> +    g_free(apdu->a_data);
>>      g_free(apdu);
>>  }
>>
>> diff --git a/libcacard/vcard.c b/libcacard/vcard.c
>> index 6aaf085..bf342aa 100644
>> --- a/libcacard/vcard.c
>> +++ b/libcacard/vcard.c
>> @@ -51,9 +51,7 @@ vcard_buffer_response_delete(VCardBufferResponse *buffer_response)
>>      if (buffer_response == NULL) {
>>          return;
>>      }
>> -    if (buffer_response->buffer) {
>> -        g_free(buffer_response->buffer);
>> -    }
>> +    g_free(buffer_response->buffer);
>>      g_free(buffer_response);
>>  }
>>
>> @@ -121,10 +119,8 @@ vcard_delete_applet(VCardApplet *applet)
>>          applet->applet_private_free(applet->applet_private);
>>          applet->applet_private = NULL;
>
> Dead store here...
>
>>      }
>> -    if (applet->aid) {
>> -        g_free(applet->aid);
>> -        applet->aid = NULL;
>> -    }
>> +    g_free(applet->aid);
>> +    applet->aid = NULL;
>
> ... and here (didn't check if there are more out of context).
>
> As usual, no good deed goes unpunished!

Preexisting.  I can try to clean them up in a follow-up patch.  Okay?

