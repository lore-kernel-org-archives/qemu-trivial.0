Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WjXvY-0005SX-Oa
	for mharc-qemu-trivial@gnu.org; Sun, 11 May 2014 13:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1WjOfS-0008Sr-Gc
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 03:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1WjOfN-0007Gj-Bw
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 03:59:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1WjOf9-0007Be-UK; Sun, 11 May 2014 03:59:12 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4B7x6Vr018299
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 11 May 2014 03:59:07 -0400
Received: from blues.lan (vpn1-5-218.ams2.redhat.com [10.36.5.218])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s4B7wv9r022998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Sun, 11 May 2014 03:59:05 -0400
Message-ID: <536F2DC0.9080809@redhat.com>
Date: Sun, 11 May 2014 10:58:56 +0300
From: Alon Levy <alevy@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1399569594-31678-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1399569594-31678-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Sun, 11 May 2014 13:52:43 -0400
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] libcacard: remove useless initializers
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
X-List-Received-Date: Sun, 11 May 2014 07:59:35 -0000

On 05/08/2014 08:19 PM, Michael Tokarev wrote:
> libcacard has many functions which initializes local variables
> at declaration time, which are always assigned some values later
> (often right after declaration).  Clean up these initializers.

How is this an improvement? Doesn't the compiler ignore this anyhow?

> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  libcacard/cac.c            |   14 +++++++-------
>  libcacard/card_7816.c      |    5 ++---
>  libcacard/vcard.c          |    4 ++--
>  libcacard/vcard_emul_nss.c |    6 +++---
>  libcacard/vreader.c        |   10 +++++-----
>  libcacard/vscclient.c      |    4 ++--
>  6 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/libcacard/cac.c b/libcacard/cac.c
> index 122129e..d1d9ee2 100644
> --- a/libcacard/cac.c
> +++ b/libcacard/cac.c
> @@ -93,8 +93,8 @@ cac_common_process_apdu(VCard *card, VCardAPDU *apdu, VCardResponse **response)
>  static VCardStatus
>  cac_applet_pki_reset(VCard *card, int channel)
>  {
> -    VCardAppletPrivate *applet_private = NULL;
> -    CACPKIAppletData *pki_applet = NULL;
> +    VCardAppletPrivate *applet_private;
> +    CACPKIAppletData *pki_applet;
>      applet_private = vcard_get_current_applet_private(card, channel);
>      assert(applet_private);
>      pki_applet = &(applet_private->u.pki_data);
> @@ -113,8 +113,8 @@ static VCardStatus
>  cac_applet_pki_process_apdu(VCard *card, VCardAPDU *apdu,
>                              VCardResponse **response)
>  {
> -    CACPKIAppletData *pki_applet = NULL;
> -    VCardAppletPrivate *applet_private = NULL;
> +    CACPKIAppletData *pki_applet;
> +    VCardAppletPrivate *applet_private;
>      int size, next;
>      unsigned char *sign_buffer;
>      vcard_7816_status_t status;
> @@ -288,7 +288,7 @@ cac_applet_container_process_apdu(VCard *card, VCardAPDU *apdu,
>  static void
>  cac_delete_pki_applet_private(VCardAppletPrivate *applet_private)
>  {
> -    CACPKIAppletData *pki_applet_data = NULL;
> +    CACPKIAppletData *pki_applet_data;
>  
>      if (applet_private == NULL) {
>          return;
> @@ -336,8 +336,8 @@ static VCardApplet *
>  cac_new_pki_applet(int i, const unsigned char *cert,
>                     int cert_len, VCardKey *key)
>  {
> -    VCardAppletPrivate *applet_private = NULL;
> -    VCardApplet *applet = NULL;
> +    VCardAppletPrivate *applet_private;
> +    VCardApplet *applet;
>      unsigned char pki_aid[] = { 0xa0, 0x00, 0x00, 0x00, 0x79, 0x01, 0x00 };
>      int pki_aid_len = sizeof(pki_aid);
>  
> diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
> index bca8c4a..a54f880 100644
> --- a/libcacard/card_7816.c
> +++ b/libcacard/card_7816.c
> @@ -416,7 +416,7 @@ VCARD_RESPONSE_NEW_STATIC_STATUS(VCARD7816_STATUS_ERROR_GENERAL)
>  VCardResponse *
>  vcard_make_response(vcard_7816_status_t status)
>  {
> -    VCardResponse *response = NULL;
> +    VCardResponse *response;
>  
>      switch (status) {
>      /* known 7816 response codes */
> @@ -543,9 +543,8 @@ vcard_make_response(vcard_7816_status_t status)
>              return VCARD_RESPONSE_GET_STATIC(
>                          VCARD7816_STATUS_EXC_ERROR_MEMORY_FAILURE);
>          }
> +        return response;
>      }
> -    assert(response);
> -    return response;
>  }
>  
>  /*
> diff --git a/libcacard/vcard.c b/libcacard/vcard.c
> index 227e477..6aaf085 100644
> --- a/libcacard/vcard.c
> +++ b/libcacard/vcard.c
> @@ -166,8 +166,8 @@ vcard_reference(VCard *vcard)
>  void
>  vcard_free(VCard *vcard)
>  {
> -    VCardApplet *current_applet = NULL;
> -    VCardApplet *next_applet = NULL;
> +    VCardApplet *current_applet;
> +    VCardApplet *next_applet;
>  
>      if (vcard == NULL) {
>          return;
> diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
> index 75b9d79..3f38a4c 100644
> --- a/libcacard/vcard_emul_nss.c
> +++ b/libcacard/vcard_emul_nss.c
> @@ -367,7 +367,7 @@ vcard_7816_status_t
>  vcard_emul_login(VCard *card, unsigned char *pin, int pin_len)
>  {
>      PK11SlotInfo *slot;
> -    unsigned char *pin_string = NULL;
> +    unsigned char *pin_string;
>      int i;
>      SECStatus rv;
>  
> @@ -423,7 +423,7 @@ static VReader *
>  vcard_emul_find_vreader_from_slot(PK11SlotInfo *slot)
>  {
>      VReaderList *reader_list = vreader_get_reader_list();
> -    VReaderListEntry *current_entry = NULL;
> +    VReaderListEntry *current_entry;
>  
>      if (reader_list == NULL) {
>          return NULL;
> @@ -1050,7 +1050,7 @@ void
>  vcard_emul_replay_insertion_events(void)
>  {
>      VReaderListEntry *current_entry;
> -    VReaderListEntry *next_entry = NULL;
> +    VReaderListEntry *next_entry;
>      VReaderList *list = vreader_get_reader_list();
>  
>      for (current_entry = vreader_list_get_first(list); current_entry;
> diff --git a/libcacard/vreader.c b/libcacard/vreader.c
> index 9304a28..22dfe43 100644
> --- a/libcacard/vreader.c
> +++ b/libcacard/vreader.c
> @@ -341,7 +341,7 @@ void
>  vreader_list_delete(VReaderList *list)
>  {
>      VReaderListEntry *current_entry;
> -    VReaderListEntry *next_entry = NULL;
> +    VReaderListEntry *next_entry;
>      for (current_entry = vreader_list_get_first(list); current_entry;
>           current_entry = next_entry) {
>          next_entry = vreader_list_get_next(current_entry);
> @@ -432,8 +432,8 @@ vreader_list_unlock(void)
>  static VReaderList *
>  vreader_copy_list(VReaderList *list)
>  {
> -    VReaderList *new_list = NULL;
> -    VReaderListEntry *current_entry = NULL;
> +    VReaderList *new_list;
> +    VReaderListEntry *current_entry;
>  
>      new_list = vreader_list_new();
>      if (new_list == NULL) {
> @@ -465,7 +465,7 @@ VReader *
>  vreader_get_reader_by_id(vreader_id_t id)
>  {
>      VReader *reader = NULL;
> -    VReaderListEntry *current_entry = NULL;
> +    VReaderListEntry *current_entry;
>  
>      if (id == (vreader_id_t) -1) {
>          return NULL;
> @@ -489,7 +489,7 @@ VReader *
>  vreader_get_reader_by_name(const char *name)
>  {
>      VReader *reader = NULL;
> -    VReaderListEntry *current_entry = NULL;
> +    VReaderListEntry *current_entry;
>  
>      vreader_list_lock();
>      for (current_entry = vreader_list_get_first(vreader_list); current_entry;
> diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
> index 3477ab3..17ff075 100644
> --- a/libcacard/vscclient.c
> +++ b/libcacard/vscclient.c
> @@ -131,8 +131,8 @@ static void *
>  event_thread(void *arg)
>  {
>      unsigned char atr[MAX_ATR_LEN];
> -    int atr_len = MAX_ATR_LEN;
> -    VEvent *event = NULL;
> +    int atr_len;
> +    VEvent *event;
>      unsigned int reader_id;
>  
>  
> 


