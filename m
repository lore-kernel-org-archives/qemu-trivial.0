Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ryoeC-0004Po-QZ
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2024 04:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ryoeB-0004P6-IF
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 04:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ryoe8-0002jZ-W1
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 04:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713773008;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=llG8QCLYHrTRhJt07+taejWqEemJicMnRMh0WVPm24Q=;
 b=a7wRRiAF9JTWSpOYFWbOKebkDog86cEQtKA103swAGqOhC4oc1EyoqdBHW8LWwHyTmiXDT
 SkNIpBc3lyrLgt/Wl7XOrTDsTiuDBHFVmeQkEwhILJhCA6IRyvrmmdJ+ezK6ZUo3tm1/NU
 C0aaL63egUzNkHcFZspTpEuvStnlRSA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-nV8OWo7zNY223-Z4VSzQSw-1; Mon,
 22 Apr 2024 04:03:24 -0400
X-MC-Unique: nV8OWo7zNY223-Z4VSzQSw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 586183C000B8;
 Mon, 22 Apr 2024 08:03:24 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F4A1492BC7;
 Mon, 22 Apr 2024 08:03:22 +0000 (UTC)
Date: Mon, 22 Apr 2024 09:03:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/3] Remove useless architecture prefix from the CPU list
Message-ID: <ZiYZyOqeM2tYPcCs@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240420054606.13353-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240420054606.13353-1-thuth@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.42,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 22 Apr 2024 08:03:31 -0000

On Sat, Apr 20, 2024 at 07:46:03AM +0200, Thomas Huth wrote:
> Printing an architecture prefix in front of each CPU name is not helpful
> at all: It is confusing for the users since they don't know whether they
> have to specify these letters for the "-cpu" parameter, too, and it also
> takes some precious space in the dense output of the CPU entries. Let's
> simply remove those now.

Could it be said that this arch prefix is about to finally become useful
with Philippe's patches to add a 'qemu-system-any' command covering
multiple arches ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


