Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxdnJ-0007HP-5x
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2020 17:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jxdnH-0007HI-U9
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 17:57:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53263
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jxdnG-0007bE-7J
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 17:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595282272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTCaevgJZ+uxVPg1fCYyf2baBa4sYBZ1vIMs2xB3c1s=;
 b=FWZhH67/j/FSNcO5HuR1L8o51opMk8uDvCh8i3Y2gQZ1S+yX0p2WzYhaqA6jWFqEGaRJV0
 VWJnCXm1W/p+fJZQDRSGAn9Bh+GttSurnhjs8sEz+yJoM6amHItTksPrX5NSNfhq213C/9
 yBMP6iqgTVHwNTSx4z0lXWr2G4fJknQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-ZD8LjLLpNeWthaBa-jLAmg-1; Mon, 20 Jul 2020 17:57:49 -0400
X-MC-Unique: ZD8LjLLpNeWthaBa-jLAmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C67618C63C0;
 Mon, 20 Jul 2020 21:57:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-27.ams2.redhat.com
 [10.36.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87CDF5FC31;
 Mon, 20 Jul 2020 21:57:43 +0000 (UTC)
Subject: Re: [PATCH-for-5.1] hw/nvram/fw_cfg: Let fw_cfg_add_from_generator()
 return boolean value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20200720123521.8135-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <34e8619f-4301-d746-fe3f-c340040c22c1@redhat.com>
Date: Mon, 20 Jul 2020 23:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200720123521.8135-1-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 17:57:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 20 Jul 2020 21:57:56 -0000

On 07/20/20 14:35, Philippe Mathieu-Daudé wrote:
> Commits b6d7e9b66f..a43770df5d simplified the error propagation.
> Similarly to commit 6fd5bef10b "qom: Make functions taking Error**
> return bool, not void", let fw_cfg_add_from_generator() return a
> boolean value, not void.
> This allow to simplify parse_fw_cfg() and fixes the error handling
> issue reported by Coverity (CID 1430396):
> 
>   In parse_fw_cfg():
> 
>     Variable assigned once to a constant guards dead code.
> 
>     Local variable local_err is assigned only once, to a constant
>     value, making it effectively constant throughout its scope.
>     If this is not the intent, examine the logic to see if there
>     is a missing assignment that would make local_err not remain
>     constant.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: Coverity CID 1430396: 'Constant' variable guards dead code (DEADCODE)
> Fixes: 6552d87c48 ("softmmu/vl: Let -fw_cfg option take a 'gen_id' argument")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/nvram/fw_cfg.h |  4 +++-
>  hw/nvram/fw_cfg.c         | 10 ++++++----
>  softmmu/vl.c              |  6 +-----
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 11feae3177..d90857f092 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -302,8 +302,10 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename, void *data,
>   * will be used; also, a new entry will be added to the file directory
>   * structure residing at key value FW_CFG_FILE_DIR, containing the item name,
>   * data size, and assigned selector key value.
> + *
> + * Returns: %true on success, %false on error.
>   */
> -void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
> +bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
>                                 const char *gen_id, Error **errp);
>  
>  FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 3b1811d3bf..c88aec4341 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -1032,7 +1032,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
>      return NULL;
>  }
>  
> -void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
> +bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
>                                 const char *gen_id, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -1044,20 +1044,22 @@ void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
>      obj = object_resolve_path_component(object_get_objects_root(), gen_id);
>      if (!obj) {
>          error_setg(errp, "Cannot find object ID '%s'", gen_id);
> -        return;
> +        return false;
>      }
>      if (!object_dynamic_cast(obj, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)) {
>          error_setg(errp, "Object ID '%s' is not a '%s' subclass",
>                     gen_id, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE);
> -        return;
> +        return false;
>      }
>      klass = FW_CFG_DATA_GENERATOR_GET_CLASS(obj);
>      array = klass->get_data(obj, errp);
>      if (*errp) {
> -        return;
> +        return false;
>      }
>      size = array->len;
>      fw_cfg_add_file(s, filename, g_byte_array_free(array, TRUE), size);
> +
> +    return true;
>  }
>  
>  static void fw_cfg_machine_reset(void *opaque)
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index f476ef89ed..3416241557 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2070,11 +2070,7 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
>          size = strlen(str); /* NUL terminator NOT included in fw_cfg blob */
>          buf = g_memdup(str, size);
>      } else if (nonempty_str(gen_id)) {
> -        Error *local_err = NULL;
> -
> -        fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        if (!fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp)) {
>              return -1;
>          }
>          return 0;
> 

The retvals seem OK, but I have no idea if this plays nicely with the
new ERRP_GUARD (which I'm just noticing in fw_cfg_add_from_generator()).

FWIW

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo


