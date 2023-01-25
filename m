Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKeal-0000ur-Vd
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2023 07:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKeaY-0000pl-8Y
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 07:09:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKeaV-0006mH-Jq
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 07:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674648550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=12nkB9kSuFfW2z6v/QiHO68Z5qeumKAVjKJQaeN+mXw=;
 b=by9FjUsvHi3ONzE5AsKKU70uRrKwv3INC96JjIHFmGodfvWXfuEe7StpILzlcsqG144kxb
 6oeL669IS/fP7h5IXGE43fShR9m6uJ5GpfbAgWWikdcVNWG+dhZOnUaosA9UaZd6QWi/07
 lXIXg00iE1mHIEbZJDMsbmQRNo/tkwk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-zmfAJmduNIaNO7AD7JuVDQ-1; Wed, 25 Jan 2023 07:09:08 -0500
X-MC-Unique: zmfAJmduNIaNO7AD7JuVDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5110F3811F49;
 Wed, 25 Jan 2023 12:09:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A013B2026D4B;
 Wed, 25 Jan 2023 12:09:07 +0000 (UTC)
Date: Wed, 25 Jan 2023 12:09:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, wenchao.wang@intel.com
Subject: Re: [PATCH] docs/about/deprecated: Mark HAXM as deprecated
Message-ID: <Y9Eb4ZMm0ll4xcM9@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230125102053.902098-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230125102053.902098-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Jan 2023 12:09:17 -0000

On Wed, Jan 25, 2023 at 11:20:53AM +0100, Thomas Huth wrote:
> The HAXM project has been retired (see https://github.com/intel/haxm#status),
> so we should mark the code in QEMU as deprecated (and finally remove it
> unless somebody else picks the project up again - which is quite unlikely
> since there are now whpx and hvf on these operating systems, too).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 3f4d678eb4..da2e6fe63d 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -93,6 +93,12 @@ form is preferred.
>  The HPET setting has been turned into a machine property.
>  Use ``-machine hpet=off`` instead.
>  
> +``-accel hax`` (since 8.0)
> +''''''''''''''''''''''''''
> +
> +The HAXM project has been retired (see https://github.com/intel/haxm#status).
> +Use "whpx" (on Windows) or "hvf" (on macOS) instead.
> +

Should we print a warning message from meson when someone enables this ?

We've tended to do that when we've deprecated other platforms in the
past, though not consistently

>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> -- 
> 2.31.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


