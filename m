Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dakB7-0004pV-RP
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:54:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dakB5-0004oa-4I
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 10:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dakB1-00059G-6j
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 10:54:15 -0400
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1dakB0-00057x-SN
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 10:54:11 -0400
Received: by mail-wm0-f51.google.com with SMTP id m85so95582092wma.1
	for <qemu-trivial@nongnu.org>; Thu, 27 Jul 2017 07:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CTYfr8CLkjb5/sYlTUXU5jr3XDK+anuIEUgbQySrJHQ=;
	b=jXfSkcttZWkY0QekcoLk4TRLw72LIZPRTzxngZ4QlLBa849nspAMlSVH8Yc9DHm8GI
	97Wh0itfNdS2+yxqgoLAcy/9bdf6B/dWRYn8RzrdF/vGlzUVV94OuEAFUdN/pZV7UyYz
	TWcHoLN9R9B5BHzK83ObVaJXoXVB+ghZBKacws4n8xUwB8lAq+hqCKZi6xBZwGm6t7Cd
	jC2Z5DgmYC3SB/TV6XbuwBEcBsahleiklWwMX4a042foAm08LtgYWnc3IhbfqZLi3GN3
	HaWaUdhvyN2gAAh/DkeeXzC01p85OoTABmQTnyx29m9OKhH3ZGS2teRHc8gwgbSKnxeb
	P/4w==
X-Gm-Message-State: AIVw110J50DQiDlahHPKYmELc3VK21GhyntYKfY3R35kZJW6dmovUkOj
	4hqO4sX0WcYkhVSD
X-Received: by 10.28.99.11 with SMTP id x11mr3219104wmb.164.1501167249531;
	Thu, 27 Jul 2017 07:54:09 -0700 (PDT)
Received: from [192.168.10.165] (94-39-192-75.adsl-ull.clienti.tiscali.it.
	[94.39.192.75]) by smtp.gmail.com with ESMTPSA id
	q185sm2699299wmd.19.2017.07.27.07.54.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 07:54:08 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-17-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1fac8158-b1b4-5dea-9111-ef6ed3602ee4@redhat.com>
Date: Thu, 27 Jul 2017 16:54:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.51
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 v2 17/20] bt-sdp:
 fix memory leak in sdp_service_record_build()
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
X-List-Received-Date: Thu, 27 Jul 2017 14:54:16 -0000

On 27/07/2017 04:42, Philippe Mathieu-Daudé wrote:
> hw/bt/sdp.c:753:5: warning: Potential leak of memory pointed to by 'data'
>     qsort(record->attribute_list, record->attributes,
>     ^~~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/bt/*:
> get_maintainer.pl: No maintainers found
> 
>  hw/bt/sdp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
> index f67b3b89c0..7b2186e1f4 100644
> --- a/hw/bt/sdp.c
> +++ b/hw/bt/sdp.c
> @@ -711,7 +711,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
>                  struct sdp_def_service_s *def, int handle)
>  {
>      int len = 0;
> -    uint8_t *data;
> +    uint8_t *buf, *data;
>      int *uuid;
>  
>      record->uuids = 0;
> @@ -725,7 +725,8 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
>              g_malloc0(record->attributes * sizeof(*record->attribute_list));
>      record->uuid =
>              g_malloc0(record->uuids * sizeof(*record->uuid));
> -    data = g_malloc(len);
> +    buf = g_malloc(len);
> +    data = buf;
>  
>      record->attributes = 0;
>      uuid = record->uuid;
> @@ -748,6 +749,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
>          record->attribute_list[record->attributes ++].len = len;
>          data += len;
>      }
> +    g_free(buf);
>  
>      /* Sort the attribute list by the AttributeID */
>      qsort(record->attribute_list, record->attributes,
> 

This is wrong, but the code is insane and wrong too so it's not your
fault. :)  The allocated memory escapes here:
    
            record->attribute_list[record->attributes].pair = data;
    
So clang is correct that the memory might leak if len is zero.  We
know it isn't, so there is no leak.  An assertion could shut up clang.

But the craziness doesn't end there.  The memory is freed by
bt_l2cap_sdp_close_ch:
    
           g_free(sdp->service_list[i].attribute_list->pair);
    
which actually should have been written:
    
           g_free(sdp->service_list[i].attribute_list[0].pair);

because the first element of the array points to the malloc-ed buffer.

The attribute_list is sorted with qsort, which would be very fishy,
but indeed the first entry of attribute_list should point to data
even after the qsort, because the first record has id
SDP_ATTR_RECORD_HANDLE, whose numeric value is zero.  Another
assertion will help here but... hang on...

the qsort function is
    
        static int sdp_attributeid_compare(
                    const struct sdp_service_attribute_s *a,
                    const struct sdp_service_attribute_s *b)
        {
            return (int) b->attribute_id - a->attribute_id;
        }
    
and _no one ever_ writes attribute_id.  So it only works if qsort is
stable, and who knows what else is broken, but we can fix it by
setting attribute_id in the while loop.

The patch after the signature should do it.  Please review carefully
because I've no idea how to test this stuff.

Paolo

diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
index f67b3b89c0..f16a0f0b09 100644
--- a/hw/bt/sdp.c
+++ b/hw/bt/sdp.c
@@ -580,7 +580,7 @@ static void bt_l2cap_sdp_close_ch(void *opaque)
     int i;
 
     for (i = 0; i < sdp->services; i ++) {
-        g_free(sdp->service_list[i].attribute_list->pair);
+        g_free(sdp->service_list[i].attribute_list[0].pair);
         g_free(sdp->service_list[i].attribute_list);
         g_free(sdp->service_list[i].uuid);
     }
@@ -720,6 +720,8 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
         len += sdp_attr_max_size(&def->attributes[record->attributes ++].data,
                         &record->uuids);
     }
+
+    assert(len > 0);
     record->uuids = pow2ceil(record->uuids);
     record->attribute_list =
             g_malloc0(record->attributes * sizeof(*record->attribute_list));
@@ -730,12 +730,14 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
     record->attributes = 0;
     uuid = record->uuid;
     while (def->attributes[record->attributes].data.type) {
+        int attribute_id = def->attributes[record->attributes].id;
         record->attribute_list[record->attributes].pair = data;
+        record->attribute_list[record->attributes].attribute_id = attribute_id;
 
         len = 0;
         data[len ++] = SDP_DTYPE_UINT | SDP_DSIZE_2;
-        data[len ++] = def->attributes[record->attributes].id >> 8;
-        data[len ++] = def->attributes[record->attributes].id & 0xff;
+        data[len ++] = attribute_id >> 8;
+        data[len ++] = attribute_id & 0xff;
         len += sdp_attr_write(data + len,
                         &def->attributes[record->attributes].data, &uuid);
 
@@ -749,10 +751,15 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
         data += len;
     }
 
-    /* Sort the attribute list by the AttributeID */
+    /* Sort the attribute list by the AttributeID.  The first must be
+     * SDP_ATTR_RECORD_HANDLE so that bt_l2cap_sdp_close_ch can free
+     * the buffer.
+     */
     qsort(record->attribute_list, record->attributes,
                     sizeof(*record->attribute_list),
                     (void *) sdp_attributeid_compare);
+    assert(record->attribute_list[0].pair == data);
+
     /* Sort the searchable UUIDs list for bisection */
     qsort(record->uuid, record->uuids,
                     sizeof(*record->uuid),

