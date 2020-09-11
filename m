Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGdUC-00054s-W7
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 03:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGdUB-00051h-GR
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 03:28:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39044
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGdU9-0001ix-Li
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 03:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599809320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JHiQFD3vupbkNfCoZoJphbTkUL+RRIYm7TfbINdW/ro=;
 b=f4oxr5Sz16WRK2VYmPk8qvMRhozo/PO8dN1sw8BI5fpXpJFGHbGCFM7u9gfEbrjK2pQmKD
 3U8gpw9gjZhFUXyDdzB16+VcGTtnsGujn0eVt0ELWmS8RwTg5w+AaEagHAYkhrcYnzSJGd
 uPMOPjVsWEQEtX+hZBIhceIDdSXc2pY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-LEDdC3q0MauF_O_yZG_Z8w-1; Fri, 11 Sep 2020 03:28:36 -0400
X-MC-Unique: LEDdC3q0MauF_O_yZG_Z8w-1
Received: by mail-ej1-f70.google.com with SMTP id li24so4205305ejb.6
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 00:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JHiQFD3vupbkNfCoZoJphbTkUL+RRIYm7TfbINdW/ro=;
 b=iCewpqxlqBn6RBJOLhSlVHlWK1vt/RbA0ngfXPnDD4PpCK66frXq2vSNOvKjmlwkzk
 +HiUAG9LsrQrNVyuS++IpDQZzXZxrAB/Em9x1c2wEgPkX+D0B5WnRC7Vtx1XXAWmwlKZ
 dezGRPcteIqjaO4vfekcnatlJHy7k770gVeX4Q3fu+hTEAHBZqb14+Fti4HhCwhJaQeV
 7ZkWfScX6NLh7fT53K1So1jxeOPra02QoxBVzVcjl7n2GslUnLCY8lhOpa+YiFad8tYZ
 7517we15ebNN/d2H4skqu3MHUw1+QucEdOKta7Rkwsvf76vWFij67gSjjCRchiCI3PlU
 ZZMA==
X-Gm-Message-State: AOAM531pva0WcwE5D1p9D1rYguTUPxOblPBOI4KkAF/8VMVk5e84B35g
 4gEvAgdCFdxPmOwqldqR8O4z7WUN64ns/LYM7CH/7MiLt16lzpFQD1He8BtLvpN1ruVDyL8Ba/8
 mETRsfYqiJiyQ7iB2Mw==
X-Received: by 2002:a05:6402:48a:: with SMTP id
 k10mr689732edv.22.1599809315429; 
 Fri, 11 Sep 2020 00:28:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza8f0yx04MoOIRTr+QFfy5v71HO/nOCisyuoK5dyFG5uH4B/d9YBDbmug7x0U24mq2ASm0kw==
X-Received: by 2002:a05:6402:48a:: with SMTP id
 k10mr689714edv.22.1599809315254; 
 Fri, 11 Sep 2020 00:28:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:6689:90a2:a29f:8336?
 ([2001:b07:6468:f312:6689:90a2:a29f:8336])
 by smtp.gmail.com with ESMTPSA id o93sm970877edd.75.2020.09.11.00.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 00:28:34 -0700 (PDT)
Subject: Re: [PATCH 3/6] hw/dma/xilinx_axidma: Rename StreamSlave as StreamSink
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
 <20200910070131.435543-4-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <71dad67c-a36e-8cd1-1f47-7a9bba1c74b0@redhat.com>
Date: Fri, 11 Sep 2020 09:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 00:33:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 11 Sep 2020 07:28:43 -0000

On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename 'slave stream'
> as 'sink stream'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/dma/xilinx_axidma.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index cf12a852ea1..19e14a2997e 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -46,11 +46,11 @@
>       OBJECT_CHECK(XilinxAXIDMA, (obj), TYPE_XILINX_AXI_DMA)
>  
>  #define XILINX_AXI_DMA_DATA_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
>       TYPE_XILINX_AXI_DMA_DATA_STREAM)
>  
>  #define XILINX_AXI_DMA_CONTROL_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
>       TYPE_XILINX_AXI_DMA_CONTROL_STREAM)
>  
>  #define R_DMACR             (0x00 / 4)
> @@ -63,7 +63,7 @@
>  #define CONTROL_PAYLOAD_SIZE (CONTROL_PAYLOAD_WORDS * (sizeof(uint32_t)))
>  
>  typedef struct XilinxAXIDMA XilinxAXIDMA;
> -typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
> +typedef struct XilinxAXIDMAStreamSink XilinxAXIDMAStreamSink;
>  
>  enum {
>      DMACR_RUNSTOP = 1,
> @@ -118,7 +118,7 @@ struct Stream {
>      unsigned char txbuf[16 * 1024];
>  };
>  
> -struct XilinxAXIDMAStreamSlave {
> +struct XilinxAXIDMAStreamSink {
>      Object parent;
>  
>      struct XilinxAXIDMA *dma;
> @@ -133,8 +133,8 @@ struct XilinxAXIDMA {
>      uint32_t freqhz;
>      StreamSink *tx_data_dev;
>      StreamSink *tx_control_dev;
> -    XilinxAXIDMAStreamSlave rx_data_dev;
> -    XilinxAXIDMAStreamSlave rx_control_dev;
> +    XilinxAXIDMAStreamSink rx_data_dev;
> +    XilinxAXIDMAStreamSink rx_control_dev;
>  
>      struct Stream streams[2];
>  
> @@ -390,7 +390,7 @@ static size_t
>  xilinx_axidma_control_stream_push(StreamSink *obj, unsigned char *buf,
>                                    size_t len, bool eop)
>  {
> -    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
> +    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
>      struct Stream *s = &cs->dma->streams[1];
>  
>      if (len != CONTROL_PAYLOAD_SIZE) {
> @@ -407,7 +407,7 @@ xilinx_axidma_data_stream_can_push(StreamSink *obj,
>                                     StreamCanPushNotifyFn notify,
>                                     void *notify_opaque)
>  {
> -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
>      struct Stream *s = &ds->dma->streams[1];
>  
>      if (!stream_running(s) || stream_idle(s)) {
> @@ -423,7 +423,7 @@ static size_t
>  xilinx_axidma_data_stream_push(StreamSink *obj, unsigned char *buf, size_t len,
>                                 bool eop)
>  {
> -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
>      struct Stream *s = &ds->dma->streams[1];
>      size_t ret;
>  
> @@ -534,8 +534,8 @@ static const MemoryRegionOps axidma_ops = {
>  static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>  {
>      XilinxAXIDMA *s = XILINX_AXI_DMA(dev);
> -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
> -    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
> +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
> +    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(
>                                                              &s->rx_control_dev);
>      int i;
>  
> @@ -634,7 +634,7 @@ static const TypeInfo axidma_info = {
>  static const TypeInfo xilinx_axidma_data_stream_info = {
>      .name          = TYPE_XILINX_AXI_DMA_DATA_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
>      .class_init    = xilinx_axidma_stream_class_init,
>      .class_data    = &xilinx_axidma_data_stream_class,
>      .interfaces = (InterfaceInfo[]) {
> @@ -646,7 +646,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
>  static const TypeInfo xilinx_axidma_control_stream_info = {
>      .name          = TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
>      .class_init    = xilinx_axidma_stream_class_init,
>      .class_data    = &xilinx_axidma_control_stream_class,
>      .interfaces = (InterfaceInfo[]) {
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


