Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGdUE-00057b-5R
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 03:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGdUC-00053Q-9J
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 03:28:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGdUA-0001j5-G1
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 03:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599809321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UD7ECwp4WuKH9NLuZzUXFZF2DqwUuCPjbSxMoZcruU=;
 b=BQZH1FWZcZg+nM2EaVNiW/D8eTC3wdhcRyLNgO0Czj8JhgF2ip3I8MN0Bhq9ReN2qoZzZC
 qfGtxlZq16qj5WGwrcbVokdMpBZ1Ni7jNstBHvkonhP8Q41U0gyt1ZTysda1Wrxl4PA9Cs
 zhlWBiWEyG+LSCQSbLdsDyfwo1m+7Ac=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-FlQYWtOzOvqKZBin0cv7Yw-1; Fri, 11 Sep 2020 03:28:39 -0400
X-MC-Unique: FlQYWtOzOvqKZBin0cv7Yw-1
Received: by mail-ej1-f71.google.com with SMTP id m24so4210399ejr.9
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 00:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/UD7ECwp4WuKH9NLuZzUXFZF2DqwUuCPjbSxMoZcruU=;
 b=UykQ/o33ks7jCZeEWVj3TAvc3opuKfJqSNGJFlvoZfVpEFE34tyeQ6F4f1CyuOakC9
 KtEptMFKFcWamnv3C64CilHNlA+C+5cX65xfgQTqajdBPXdbuj/dM6lHG/l9ojlbcPDq
 biC37M+l84yr9RPzMfnb2e9zy5MS6XcRbgU+yuGhgrqjLYQLKL9MNnrIx53ktxN2HipA
 jS02ZL4/KBDypKr93gssU5zVnwbXaowXZSnvc7minVzNlX/Siz2NFFurLZ0bAvaL2+iY
 TC/Nd3IRCqSefU9GbRXO9+XfuyxKz+Ku6LjSK8o9pOv8M/P7jmzPSwpIZ4ORP5ApFcQG
 bmIQ==
X-Gm-Message-State: AOAM533hR4ChNEj+hGMTIbBWHIoGBc6uE7WHSLLajEJkGZOz8xYgP+xr
 jEXAW/ZAiKyRFlieu27ZpDZmJmZtjqT4xuOu6VLu1ywpJ3HGQ5gz9PhKRPnYixngKPB+L9tPF+a
 mmzMmlXimztQrudhQgg==
X-Received: by 2002:a17:906:3755:: with SMTP id
 e21mr758713ejc.39.1599809318707; 
 Fri, 11 Sep 2020 00:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhw0+AphNUR8XWpzNszy2xpzq+VafpJOf0gykSCDf8EMJ2JEc2iVCtKmLEonOq0RmFlJulWA==
X-Received: by 2002:a17:906:3755:: with SMTP id
 e21mr758688ejc.39.1599809318522; 
 Fri, 11 Sep 2020 00:28:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:6689:90a2:a29f:8336?
 ([2001:b07:6468:f312:6689:90a2:a29f:8336])
 by smtp.gmail.com with ESMTPSA id f13sm947456edn.73.2020.09.11.00.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 00:28:37 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/net/xilinx_axienet: Rename StreamSlave as
 StreamSink
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joel Stanley <joel@jms.id.au>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9214b56d-59e7-1229-bf01-b6dca0445014@redhat.com>
Date: Fri, 11 Sep 2020 09:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:28:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 11 Sep 2020 07:28:44 -0000

On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename 'slave stream'
> as 'sink stream'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/net/xilinx_axienet.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 0c4ac727207..4e48535f373 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -46,11 +46,11 @@
>       OBJECT_CHECK(XilinxAXIEnet, (obj), TYPE_XILINX_AXI_ENET)
>  
>  #define XILINX_AXI_ENET_DATA_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
>       TYPE_XILINX_AXI_ENET_DATA_STREAM)
>  
>  #define XILINX_AXI_ENET_CONTROL_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
>       TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
>  
>  /* Advertisement control register. */
> @@ -310,10 +310,10 @@ struct TEMAC  {
>      void *parent;
>  };
>  
> -typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
> +typedef struct XilinxAXIEnetStreamSink XilinxAXIEnetStreamSink;
>  typedef struct XilinxAXIEnet XilinxAXIEnet;
>  
> -struct XilinxAXIEnetStreamSlave {
> +struct XilinxAXIEnetStreamSink {
>      Object parent;
>  
>      struct XilinxAXIEnet *enet;
> @@ -325,8 +325,8 @@ struct XilinxAXIEnet {
>      qemu_irq irq;
>      StreamSink *tx_data_dev;
>      StreamSink *tx_control_dev;
> -    XilinxAXIEnetStreamSlave rx_data_dev;
> -    XilinxAXIEnetStreamSlave rx_control_dev;
> +    XilinxAXIEnetStreamSink rx_data_dev;
> +    XilinxAXIEnetStreamSink rx_control_dev;
>      NICState *nic;
>      NICConf conf;
>  
> @@ -859,7 +859,7 @@ xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
>                                     bool eop)
>  {
>      int i;
> -    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
> +    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
>      XilinxAXIEnet *s = cs->enet;
>  
>      assert(eop);
> @@ -880,7 +880,7 @@ static size_t
>  xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
>                                  bool eop)
>  {
> -    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
> +    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
>      XilinxAXIEnet *s = ds->enet;
>  
>      /* TX enable ?  */
> @@ -954,8 +954,8 @@ static NetClientInfo net_xilinx_enet_info = {
>  static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>  {
>      XilinxAXIEnet *s = XILINX_AXI_ENET(dev);
> -    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
> -    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
> +    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
> +    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(
>                                                              &s->rx_control_dev);
>  
>      object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
> @@ -1046,7 +1046,7 @@ static const TypeInfo xilinx_enet_info = {
>  static const TypeInfo xilinx_enet_data_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
>      .class_init    = xilinx_enet_data_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SINK },
> @@ -1057,7 +1057,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
>  static const TypeInfo xilinx_enet_control_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
>      .class_init    = xilinx_enet_control_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SINK },
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


