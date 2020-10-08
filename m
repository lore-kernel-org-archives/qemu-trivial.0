Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQT4f-00037Z-O2
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 06:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQT4d-00035F-KW
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 06:22:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQT4b-00045N-VD
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 06:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602152576;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KWKtlSBKecYl8vez0F8svOmCRjhVHdbW2+mCGJVEzMc=;
 b=gVjODga4v8r35BwzucVBcnzS9LJwdnXwR2Qh5wgCHjlDNzct9MgW16VT+r0zSo0u7nHRBB
 4qtOOU2/hBw0KKti+dF86bHe43MNeC0l+W+GbJqprAgyusnW0tsvN2rX77XZTr3ePWZVcQ
 52ycG7V7jWru+aIi2EfaO6qPiT1g8wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-IPnZO6HfNMCwa20IL7JtJw-1; Thu, 08 Oct 2020 06:22:45 -0400
X-MC-Unique: IPnZO6HfNMCwa20IL7JtJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0442A56C2E;
 Thu,  8 Oct 2020 10:22:44 +0000 (UTC)
Received: from redhat.com (ovpn-113-124.ams2.redhat.com [10.36.113.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C06F76642;
 Thu,  8 Oct 2020 10:22:41 +0000 (UTC)
Date: Thu, 8 Oct 2020 11:22:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chetan <chetan4windows@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] Fixing LGPL version number
Message-ID: <20201008102239.GA2526468@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201008060528.68579-1-chetan4windows@gmail.com>
 <df199cc8-c383-ed03-6244-7a204e92397b@redhat.com>
 <ba4f81dd-8e5c-1d50-311c-fdc41f9cc504@redhat.com>
 <CAPPKfOHQV44b+kkcc3QYsLXya-5Ttcbve51uqRUS0e5GyouX6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPPKfOHQV44b+kkcc3QYsLXya-5Ttcbve51uqRUS0e5GyouX6w@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 08 Oct 2020 10:22:59 -0000

On Thu, Oct 08, 2020 at 02:10:01PM +0530, Chetan wrote:
> Hello,
> 
> I'll be working on replacing the license text in LGPL licensed files with
> the SPDX identifier tag and will submit it as a separate patch.

Removing existing license text is legally dubious if you are not the
exclusive copyright on the file being changed. Yes, the kernel did it,
but there was legal work behind the scenes before that was done.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


