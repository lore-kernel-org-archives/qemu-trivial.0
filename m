Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhovL-0002yG-BI
	for mharc-qemu-trivial@gnu.org; Sun, 07 Jun 2020 02:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jhovJ-0002y4-Lt
 for qemu-trivial@nongnu.org; Sun, 07 Jun 2020 02:36:49 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39626
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jhovJ-0000rp-1y
 for qemu-trivial@nongnu.org; Sun, 07 Jun 2020 02:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591511807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=GoqZp33SoDzxHaygSqHAERwmYa1Skf5Y3XRwhGBnKIo=;
 b=UKTgnGtUKHsBwU/72+1PD6tnN59jSeuaF01TbrsFr9vOvcxesur4kJYtHNEy6GX/zyU0XP
 PYYgLR+eSIUomNywY8QMPibHcObzqF6sVxYU5uLpOg3s0ZdWtfyJIRV9qAdf1k3GdYG3Mh
 JCwlvLz6mynPKQM/ZtM9xWpR4LE4cT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-vEzg4er7Mw6vUMzYb8PV4Q-1; Sun, 07 Jun 2020 02:36:44 -0400
X-MC-Unique: vEzg4er7Mw6vUMzYb8PV4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19AF78015CB;
 Sun,  7 Jun 2020 06:36:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F00807CCEB;
 Sun,  7 Jun 2020 06:36:41 +0000 (UTC)
Subject: Re: [PATCH] hw/misc/auxbus: Use qemu_log_mask(UNIMP) instead of debug
 printf
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Fred Konrad <konrad@adacore.com>
References: <20200606070216.30952-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <393bd3e9-e242-24f1-57cd-a89481369826@redhat.com>
Date: Sun, 7 Jun 2020 08:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200606070216.30952-1-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/07 02:36:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 07 Jun 2020 06:36:49 -0000

On 06/06/2020 09.02, Philippe Mathieu-Daudé wrote:
> Replace a deprecated DPRINTF() call by qemu_log_mask(LOG_UNIMP).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/misc/auxbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index f8e7b97971..06aabf20c5 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -196,7 +196,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>          }
>          break;
>      default:
> -        DPRINTF("Not implemented!\n");
> +        qemu_log_mask(LOG_UNIMP, "AUX cmd=%u not implemented\n", cmd);
>          return AUX_NACK;
>      }
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


