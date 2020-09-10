Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGKdb-0002iJ-2N
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 07:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGKdZ-0002h2-PY
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 07:21:09 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41658
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGKdX-0000sv-3o
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 07:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599736865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rWv251ScEfhgfPY6zZhFWbej1k+8/ldak2QWUr7jQE=;
 b=Eja/rLz6S12e0Vy3DBCfh58IYo2Z6NZ/BJFK6thxxpJ0uIRihUl6PsspLXCBInsViIa0vL
 ZZ6hpZIoZs4msD+nPIYKG8zSv2MK21xQ2ZoiV9Da0aKOLp3tLxc3V7qNV2KatfzS33NaIO
 CGsTSQ6YJZg2tssvC6z2skP+8bkSHuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-T-2WD9v1Ol-5qmoF0Lt7Zg-1; Thu, 10 Sep 2020 07:21:02 -0400
X-MC-Unique: T-2WD9v1Ol-5qmoF0Lt7Zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 499D68030A9;
 Thu, 10 Sep 2020 11:21:00 +0000 (UTC)
Received: from thuth.remote.csb (unknown [10.40.194.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEFAA83565;
 Thu, 10 Sep 2020 11:20:53 +0000 (UTC)
Subject: Re: [PATCH v7 15/25] meson: remove empty else and duplicated gio deps
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200910103059.987-1-luoyonggang@gmail.com>
 <20200910103059.987-16-luoyonggang@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <438fb7da-72b0-f3cf-0680-3a69367993ab@redhat.com>
Date: Thu, 10 Sep 2020 13:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200910103059.987-16-luoyonggang@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 00:49:43
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
X-List-Received-Date: Thu, 10 Sep 2020 11:21:10 -0000

On 10/09/2020 12.30, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  meson.build | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 5421eca66a..0b1741557d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -317,7 +317,6 @@ opengl = not_found
>  if 'CONFIG_OPENGL' in config_host
>    opengl = declare_dependency(compile_args: config_host['OPENGL_CFLAGS'].split(),
>                                link_args: config_host['OPENGL_LIBS'].split())
> -else
>  endif
>  gtk = not_found
>  if 'CONFIG_GTK' in config_host
> @@ -344,11 +343,6 @@ if 'CONFIG_ICONV' in config_host
>    iconv = declare_dependency(compile_args: config_host['ICONV_CFLAGS'].split(),
>                               link_args: config_host['ICONV_LIBS'].split())
>  endif
> -gio = not_found
> -if 'CONFIG_GIO' in config_host
> -  gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
> -                           link_args: config_host['GIO_LIBS'].split())
> -endif
>  vnc = not_found
>  png = not_found
>  jpeg = not_found
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


