Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juusK-0002Yu-Ej
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2020 05:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juusI-0002Vw-SB
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:35:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54646
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juusH-0007SM-9e
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=jQpWGzBGr5cQGiIFHqMv+99/bU2xHgRSpX2lOH8D4QE=;
 b=MHOz0hT+Wg0X18eFXBZ9Ih1R5WMDDAtPf969cywE/xYvv6ch57UduNvL5AWmxUOxwDOpe/
 /K0to0QCw38G9d51JEWBnjkQ/NqgOMy6GxVselZhY/aKUzvdsZfnW4ERSvL5Uf1Z/4DFkv
 qkNbiugzHY8Yc8A38XtvUoOqsgCUeQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-H0rul3YJNU-h4F6Tk_zjow-1; Mon, 13 Jul 2020 05:35:46 -0400
X-MC-Unique: H0rul3YJNU-h4F6Tk_zjow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D59D100A8EC;
 Mon, 13 Jul 2020 09:35:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C53C74F44;
 Mon, 13 Jul 2020 09:35:40 +0000 (UTC)
Subject: Re: [PATCH 07/12] vnc: Remove the superfluous break
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <1594631086-36509-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <41e392cd-bb46-242f-197d-a82f6e277df9@redhat.com>
Date: Mon, 13 Jul 2020 11:35:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594631086-36509-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Jul 2020 09:35:51 -0000

On 13/07/2020 11.04, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove the superfluous break, as there is a "return" before.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>a
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  ui/vnc-enc-tight.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
> index 1e08518..cebd358 100644
> --- a/ui/vnc-enc-tight.c
> +++ b/ui/vnc-enc-tight.c
> @@ -1125,7 +1125,6 @@ static int send_palette_rect(VncState *vs, int x, int y,
>      }
>      default:
>          return -1; /* No palette for 8bits colors */
> -        break;
>      }
>      bytes = w * h;
>      vs->tight->tight.offset = bytes;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


