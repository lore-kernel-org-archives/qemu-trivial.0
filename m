Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t1exD-0008Tw-Mb
	for mharc-qemu-trivial@gnu.org; Fri, 18 Oct 2024 00:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1t1exB-0008QO-L1
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2024 00:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1t1exA-0003UJ-3H
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2024 00:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729227067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2DXD/44HBFMmoZZy1zCKCZEliz8wxao+RbWclm9iY2w=;
 b=gFrQiozDYqVd6EoL5QiiSvos9ovoApsoBlcCdHSSnMRhCKpS4rM9iwnyRDfg7H695WPMfg
 o+9i/jqWthjMyBRm4ddGAjya5ZcJB/rqEXbx3JMcEboz68o1S9Ps+JBgOplJoC0AiIRnIi
 9TG9+yKkEZyE5K9KffGc/Za7yiGmuqE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-1YRn2_roMoO7RRD73qHbNw-1; Fri, 18 Oct 2024 00:51:05 -0400
X-MC-Unique: 1YRn2_roMoO7RRD73qHbNw-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2e3984f50c3so1583471a91.1
 for <qemu-trivial@nongnu.org>; Thu, 17 Oct 2024 21:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729227064; x=1729831864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DXD/44HBFMmoZZy1zCKCZEliz8wxao+RbWclm9iY2w=;
 b=hao2Acl/WLMsdyjYmU9+0K4+OtLozBvdU/HzoYWfB/XebH3wxinMU+qBCzvgm9ymm4
 YTkrIUYchzBHm5aHHku0uZnSSlu8MT4jAmMme38y2OfoYXC0NCZ/rUuEQk+p4T8/69vN
 G96Bt+RwLy+u71DASt3waYL3yfLZolNVM4XF+huVk3rw3Fmj6M9UkhBHJzLJk6yIVQS6
 AGMNjYwMk437TkzfDgK6325X6WUpiyWS6jYess/HHwb0sKyzuq+7XfCWuWOoJnVe8lOG
 mv9jO3N8M7YscMFMroBLvuCo+w0wpX68s5K0NMQx1JS3/EcftQ2nUAzIWj04KRr6J00W
 BWyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL1+qVptoOUrRT8MP4nIlWXiNTz1FEf0YLx5DVZJhQuZG9DONiAbWvmeIgxGEkNqqTAGD/RNrh3VkKIio=@nongnu.org
X-Gm-Message-State: AOJu0YyUowv6/NrxqIzvAmKUBoVdV00PHNBOtddZz73VAi+MCEV/WijC
 rW2uAvYDvBddqkKs5q0+dE3k07w1dkBGK5i4tec1kxhjycLflm53jvd3Gp14Jsqy7YXfUE5N0S+
 LZbz4NSPi3zrN+/5R3pdLfyGi5qGI+u4q9zCdVSApYqcJ+YF/ny8JxD8BqauVG1mehjglRMb9zR
 XCQIIgjCz+pKuMRWBOrpdJDRDr9Cq92NwT3sk39A==
X-Received: by 2002:a17:90a:a018:b0:2e3:b168:70f5 with SMTP id
 98e67ed59e1d1-2e56172c05fmr1667084a91.21.1729227064202; 
 Thu, 17 Oct 2024 21:51:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExFBfo67QNSdIcOrLGYd0lqQdhJx3X/TVRCx17tbL4x49bySrhAVt7nDj4naCDdKzMF3xXvQduoFKPkA3X/rA=
X-Received: by 2002:a17:90a:a018:b0:2e3:b168:70f5 with SMTP id
 98e67ed59e1d1-2e56172c05fmr1667065a91.21.1729227063822; Thu, 17 Oct 2024
 21:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240909204254.1446800-1-sw@weilnetz.de>
 <CYYPR11MB8432028036D306D2FB6F4A359B9A2@CYYPR11MB8432.namprd11.prod.outlook.com>
 <bc8991ef-91af-419c-beda-f0ece8eda019@weilnetz.de>
 <CYYPR11MB8432723FB4A5A76E3ABB02699B402@CYYPR11MB8432.namprd11.prod.outlook.com>
In-Reply-To: <CYYPR11MB8432723FB4A5A76E3ABB02699B402@CYYPR11MB8432.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 18 Oct 2024 12:50:52 +0800
Message-ID: <CACGkMEu7vT6Xdpw2SYSMrhQ+bhQnBN6-u=zEmL=fW3vHR6aLMw@mail.gmail.com>
Subject: Re: [PATCH] Fix calculation of minimum in colo_compare_tcp
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Stefan Weil <sw@weilnetz.de>, Li Zhijian <lizhijian@fujitsu.com>, 
 qemu-stable <qemu-stable@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.068,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2024 04:51:09 -0000

On Fri, Oct 18, 2024 at 10:48=E2=80=AFAM Zhang, Chen <chen.zhang@intel.com>=
 wrote:
>
> Add Trivial patches Maintainers.
>
>
>
> Hi Jason/Michael/Laurent,
>
> Can you help to pick up this patch for upstream and stable?

Queued.

Btw, if you want -stable next time, please cc it.

Thanks

>
>
>
> Thanks
>
> Chen
>
>
>
> From: Stefan Weil <sw@weilnetz.de>
> Sent: Friday, October 18, 2024 3:44 AM
> To: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian <lizhijian@fujitsu.com=
>; Jason Wang <jasowang@redhat.com>; qemu-stable <qemu-stable@nongnu.org>; =
QEMU Trivial <qemu-trivial@nongnu.org>
> Cc: qemu-devel@nongnu.org
> Subject: Re: [PATCH] Fix calculation of minimum in colo_compare_tcp
>
>
>
> It looks like nobody has sent a pull request for this fix up to now. Is i=
t trivial enough for qemu-trivial? And maybe qemu-stable could also apply i=
t to older versions.
>
> Stefan W.
>
> Am 10.09.24 um 04:38 schrieb Zhang, Chen:
>
> -----Original Message-----
>
> From: Stefan Weil <sw@weilnetz.de>
>
> Sent: Tuesday, September 10, 2024 4:43 AM
>
> To: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian <lizhijian@fujitsu.com=
>;
>
> Jason Wang <jasowang@redhat.com>
>
> Cc: qemu-devel@nongnu.org; Stefan Weil <sw@weilnetz.de>
>
> Subject: [PATCH] Fix calculation of minimum in colo_compare_tcp
>
>
>
> GitHub's CodeQL reports a critical error which is fixed by using the MIN
>
> macro:
>
>
>
>     Unsigned difference expression compared to zero
>
>
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>
>
>
> Looks good to me.
>
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>
>
>
>
> Thanks
>
> Chen
>
>
>
> ---
>
>  net/colo-compare.c | 3 +--
>
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
>
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c index
>
> c4ad0ab71f..39f90c4065 100644
>
> --- a/net/colo-compare.c
>
> +++ b/net/colo-compare.c
>
> @@ -412,8 +412,7 @@ static void colo_compare_tcp(CompareState *s,
>
> Connection *conn)
>
>       * can ensure that the packet's payload is acknowledged by
>
>       * primary and secondary.
>
>      */
>
> -    uint32_t min_ack =3D conn->pack - conn->sack > 0 ?
>
> -                       conn->sack : conn->pack;
>
> +    uint32_t min_ack =3D MIN(conn->pack, conn->sack);
>
>
>
>  pri:
>
>      if (g_queue_is_empty(&conn->primary_list)) {
>
> --
>
> 2.39.3 (Apple Git-146)


