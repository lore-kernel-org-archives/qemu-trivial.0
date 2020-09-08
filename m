Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFZlF-0005TD-VH
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2020 05:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kFZlE-0005Ok-3q
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 05:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kFZlB-0000EZ-5l
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 05:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599556671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zONPNEEByK69cnX4s6/SPvowmCWzT22/Pg9OHZLNMCM=;
 b=IQWwfbvlQ8tvOzM5BVVazQhadUYxxAOg20Ui8rbCZC8G3orE0CtcUiDDK44XH5tNQhamwA
 25K7IYNpqfMk2PaTk1ZZw4oFw6S3VpF1nj/UcgRN+N50Abk3VjIEY39f72P4HQ4wVO3Bqn
 t8dIgXANzXps9a5o3byM6cXNjBT0zdE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-kRTqjbkMNKqs4MfkJ_kvEg-1; Tue, 08 Sep 2020 05:17:50 -0400
X-MC-Unique: kRTqjbkMNKqs4MfkJ_kvEg-1
Received: by mail-wm1-f70.google.com with SMTP id 189so1091817wme.5
 for <qemu-trivial@nongnu.org>; Tue, 08 Sep 2020 02:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hNND3JC+L+Ff4r2YayqvJtDdaV6xZTeqzwQ0WVbJfc8=;
 b=b0HrR5QIR3N6+50/TM656er2Tfw9fAgBLC5lqEKopPjR/xbS8JKMJAA6UomyUo2llp
 RHn7kDY4XyU67bfpe+UJYR8HXVK7ojpCaKocRsjzx7wlfIbBr7+tAgA2S2yYJZ09fR1s
 0cXv3DUS33WnuahXWND2HIs2weE5gypVKcMH/I82Z7/ll3hTuHVRvH8Jqpn7hUE2AQ58
 +n7kHzWbgu5nB6lPP+xD8CaFXsxWdAwMi06u/71dbC1RZZnW3I3urgOJfN2PJF7Zs1cU
 ZOHjMyiDIcfT0VQ0QFgg7N/2mJyOQNzTG8KvOywo5EorBdTLvh+hyUtwTjBUEOoTJYy8
 fiQg==
X-Gm-Message-State: AOAM532tuDSVUoI/GlyfTscbF13IApzZO7aOBFrhtxXCwsURB/FFcz5p
 PEHHyr1dktoolxF42Hia6fBVhz6qhAdGqep1VRJccl0Fc4IekVe6GGbfwyVbd7SrQyS1yk2oBSx
 ++/BXKbwOYM1KJWvXkw==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr3353352wml.176.1599556668860; 
 Tue, 08 Sep 2020 02:17:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUYd+QKAUGh3Rcs33/cTGfrCBbdGR95V+p9tBQm2/wYS3CYyNxDg/MSEejVGCmSG18VsV+jA==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr3353327wml.176.1599556668630; 
 Tue, 08 Sep 2020 02:17:48 -0700 (PDT)
Received: from steredhat (host-79-53-225-185.retail.telecomitalia.it.
 [79.53.225.185])
 by smtp.gmail.com with ESMTPSA id 8sm35651125wrl.7.2020.09.08.02.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 02:17:48 -0700 (PDT)
Date: Tue, 8 Sep 2020 11:17:45 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] scripts/git.orderfile: Display meson files along with
 buildsys ones
Message-ID: <20200908091745.kpoenbxefraxdzuo@steredhat>
References: <20200907161222.41915-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200907161222.41915-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 08 Sep 2020 09:17:56 -0000

On Mon, Sep 07, 2020 at 06:12:22PM +0200, Philippe Mathieu-Daudé wrote:
> Since commit a56650518f5 ("configure: integrate Meson in the build
> system") we replaced many Makefile by Meson files. Adapt the
> git.orderfile script to display the new file at the same position.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  scripts/git.orderfile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 73fd818d7f3..a021afc2d51 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -18,6 +18,7 @@ docs/*
>  configure
>  Makefile*
>  *.mak
> +meson.build
>  
>  # qapi schema
>  qapi/*.json
> -- 
> 2.26.2
> 
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


