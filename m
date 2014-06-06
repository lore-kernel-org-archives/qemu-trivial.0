Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WsxC2-0004RS-Ic
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 12:40:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WsxBr-0004DG-KT
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 12:40:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WsxBi-0005XB-Cz
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 12:40:27 -0400
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236]:37545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WsxBN-0005DU-W4; Fri, 06 Jun 2014 12:39:58 -0400
Received: by mail-we0-f182.google.com with SMTP id t60so3030398wes.41
	for <multiple recipients>; Fri, 06 Jun 2014 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=x9kkPFllP2Hwqc1VNMqmcdjD12DYuDawgguNgkJC6cg=;
	b=MwcCJeXsvEs/yCTSA7xSh5pcGzxjmHp0ndhqEgAd42iI/RNcLUyGm8I4QUsBa1gQ4K
	Cy4zkoalS0BOajBLRufDi3wV7tS+uMmF3bj6wpAOs3CFiuyGtDsmsiS3Vtn7uu5ERE37
	yGpfjWCfgK8NyYl91xbdZenv3rXskjX0a9jyFYKA5Et54NJrCxfAedALBgDBdCODP8qk
	LXCPYtEYxShSC/iJjVimlT2EB9V1OSS61bcYZ1oZTS09alG5MI3ioGr417eAkARJA5y0
	kjDeEIwz9y5PiaatOnZ/FbI7r877fIjf/8c7Xs26bqYHG2YdzXbqpu4GgKFGzLMMdLUJ
	KZTg==
X-Received: by 10.14.251.4 with SMTP id a4mr802361ees.20.1402072796954;
	Fri, 06 Jun 2014 09:39:56 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-132-7.cust.vodafonedsl.it.
	[37.117.132.7])
	by mx.google.com with ESMTPSA id m2sm23889604eey.36.2014.06.06.09.39.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Jun 2014 09:39:56 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5391EEDA.7030207@redhat.com>
Date: Fri, 06 Jun 2014 18:39:54 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1402072328-6871-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1402072328-6871-1-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::236
Cc: qemu-trivial@nongnu.org, alevy@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] libcacard: Drop superfluous conditionals
	around g_free()
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
X-List-Received-Date: Fri, 06 Jun 2014 16:40:36 -0000

Il 06/06/2014 18:32, Markus Armbruster ha scritto:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  libcacard/cac.c            | 14 ++++----------
>  libcacard/card_7816.c      | 12 +++---------
>  libcacard/vcard.c          | 10 +++-------
>  libcacard/vcard_emul_nss.c |  4 +---
>  libcacard/vreader.c        |  4 +---
>  5 files changed, 12 insertions(+), 32 deletions(-)
>
> diff --git a/libcacard/cac.c b/libcacard/cac.c
> index 0a0163d..ae8c378 100644
> --- a/libcacard/cac.c
> +++ b/libcacard/cac.c
> @@ -100,10 +100,8 @@ cac_applet_pki_reset(VCard *card, int channel)
>      pki_applet = &(applet_private->u.pki_data);
>
>      pki_applet->cert_buffer = NULL;
> -    if (pki_applet->sign_buffer) {
> -        g_free(pki_applet->sign_buffer);
> -        pki_applet->sign_buffer = NULL;
> -    }
> +    g_free(pki_applet->sign_buffer);
> +    pki_applet->sign_buffer = NULL;
>      pki_applet->cert_buffer_len = 0;
>      pki_applet->sign_buffer_len = 0;
>      return VCARD_DONE;
> @@ -285,12 +283,8 @@ cac_delete_pki_applet_private(VCardAppletPrivate *applet_private)
>          return;
>      }
>      pki_applet_data = &(applet_private->u.pki_data);
> -    if (pki_applet_data->cert != NULL) {
> -        g_free(pki_applet_data->cert);
> -    }
> -    if (pki_applet_data->sign_buffer != NULL) {
> -        g_free(pki_applet_data->sign_buffer);
> -    }
> +    g_free(pki_applet_data->cert);
> +    g_free(pki_applet_data->sign_buffer);
>      if (pki_applet_data->key != NULL) {
>          vcard_emul_delete_key(pki_applet_data->key);
>      }
> diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
> index a54f880..814fa16 100644
> --- a/libcacard/card_7816.c
> +++ b/libcacard/card_7816.c
> @@ -172,16 +172,12 @@ vcard_response_delete(VCardResponse *response)
>      switch (response->b_type) {
>      case VCARD_MALLOC:
>          /* everything was malloc'ed */
> -        if (response->b_data) {
> -            g_free(response->b_data);
> -        }
> +        g_free(response->b_data);
>          g_free(response);
>          break;
>      case VCARD_MALLOC_DATA:
>          /* only the data buffer was malloc'ed */
> -        if (response->b_data) {
> -            g_free(response->b_data);
> -        }
> +        g_free(response->b_data);
>          break;
>      case VCARD_MALLOC_STRUCT:
>          /* only the structure was malloc'ed */
> @@ -358,9 +354,7 @@ vcard_apdu_delete(VCardAPDU *apdu)
>      if (apdu == NULL) {
>          return;
>      }
> -    if (apdu->a_data) {
> -        g_free(apdu->a_data);
> -    }
> +    g_free(apdu->a_data);
>      g_free(apdu);
>  }
>
> diff --git a/libcacard/vcard.c b/libcacard/vcard.c
> index 6aaf085..bf342aa 100644
> --- a/libcacard/vcard.c
> +++ b/libcacard/vcard.c
> @@ -51,9 +51,7 @@ vcard_buffer_response_delete(VCardBufferResponse *buffer_response)
>      if (buffer_response == NULL) {
>          return;
>      }
> -    if (buffer_response->buffer) {
> -        g_free(buffer_response->buffer);
> -    }
> +    g_free(buffer_response->buffer);
>      g_free(buffer_response);
>  }
>
> @@ -121,10 +119,8 @@ vcard_delete_applet(VCardApplet *applet)
>          applet->applet_private_free(applet->applet_private);
>          applet->applet_private = NULL;

Dead store here...

>      }
> -    if (applet->aid) {
> -        g_free(applet->aid);
> -        applet->aid = NULL;
> -    }
> +    g_free(applet->aid);
> +    applet->aid = NULL;

... and here (didn't check if there are more out of context).

As usual, no good deed goes unpunished!

Paolo

>      g_free(applet);
>  }
>
> diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
> index cefc383..f1bba57 100644
> --- a/libcacard/vcard_emul_nss.c
> +++ b/libcacard/vcard_emul_nss.c
> @@ -471,9 +471,7 @@ vreader_emul_delete(VReaderEmul *vreader_emul)
>      if (vreader_emul->slot) {
>          PK11_FreeSlot(vreader_emul->slot);
>      }
> -    if (vreader_emul->type_params) {
> -        g_free(vreader_emul->type_params);
> -    }
> +    g_free(vreader_emul->type_params);
>      g_free(vreader_emul);
>  }
>
> diff --git a/libcacard/vreader.c b/libcacard/vreader.c
> index d2a9b7d..ffa05b6 100644
> --- a/libcacard/vreader.c
> +++ b/libcacard/vreader.c
> @@ -155,9 +155,7 @@ vreader_free(VReader *reader)
>      if (reader->card) {
>          vcard_free(reader->card);
>      }
> -    if (reader->name) {
> -        g_free(reader->name);
> -    }
> +    g_free(reader->name);
>      if (reader->reader_private_free) {
>          reader->reader_private_free(reader->reader_private);
>      }
>


