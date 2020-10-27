Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXHoC-0004qc-Nn
	for mharc-qemu-trivial@gnu.org; Tue, 27 Oct 2020 01:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXHoB-0004pn-E7
 for qemu-trivial@nongnu.org; Tue, 27 Oct 2020 01:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXHo7-0001Bn-HS
 for qemu-trivial@nongnu.org; Tue, 27 Oct 2020 01:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603777565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOdqFk4Hso1aLDKQwRcMJdd7xXYAQCwsOPzjH7kT6gg=;
 b=e01+DwqnKIkKnqqJTnTBPp9XMPj5vuR00cBRkEjOLmWMl7azFFOtC7p8whnEWEh3O+emzQ
 jz4aPFIdfuzsTsXHlW1S1copNE/Ymcr8rtfRlX2W0ZkQtvkLDEg2xJiDpVGwl8+yy1iUp7
 v0HnntzBzZdHtk+U7uIFQcbFTd066KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-NisLuYIpNv-GZG49TwzYTA-1; Tue, 27 Oct 2020 01:46:01 -0400
X-MC-Unique: NisLuYIpNv-GZG49TwzYTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16FD58049D5;
 Tue, 27 Oct 2020 05:46:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-126.ams2.redhat.com [10.36.112.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA1FA55789;
 Tue, 27 Oct 2020 05:45:58 +0000 (UTC)
Subject: Re: [PATCH v2] CHANGELOG: remove disused file
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org
References: <20201026195131.13848-1-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d76bc285-1db5-76d3-275f-4b4040568f8a@redhat.com>
Date: Tue, 27 Oct 2020 06:45:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201026195131.13848-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 27 Oct 2020 05:46:11 -0000

On 26/10/2020 20.51, John Snow wrote:
> There's no reason to keep this here; the versions described are
> ancient. Everything here is still mirrored on
> https://wiki.qemu.org/ChangeLog/old if anyone is curious; otherwise, use
> the git history.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
> 
> V2: Add new blurb in README.rst to redirect to our wiki changelog.
> 
>  README.rst |   8 +
>  Changelog  | 580 -----------------------------------------------------
>  2 files changed, 8 insertions(+), 580 deletions(-)
>  delete mode 100644 Changelog

Reviewed-by: Thomas Huth <thuth@redhat.com>


