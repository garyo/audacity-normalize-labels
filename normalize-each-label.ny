;nyquist plug-in
;version 4
;type tool
;name "Normalize Each Label"
;author "Gary Oberbrunner"
;release 1.0
;copyright "Released under MIT license"

;; Normalize each labeled region to -1 dB peak level
;; Usage: Label your song regions, select all, run from Tools menu

(let ((labels (aud-get-info "labels"))
      (count 0))

  (if (not labels)
      (format nil "No labels found. Please create labels for each region first.")

    (progn
      ;; Process each label track
      ;; Structure: ((track-index ((start end "name") (start end "name") ...)) ...)
      (dolist (track-entry labels)
        (let ((track-labels (second track-entry)))  ; Get the list of labels
          (dolist (label track-labels)
            (let ((start (first label))
                  (end (second label))
                  (name (third label)))
              (when (> end start)
                ;; Select the region
                (aud-do (format nil "SelectTime: Start=~A End=~A" start end))
                ;; Normalize to -1 dB
                (aud-do "Normalize: PeakLevel=-1 ApplyGain=1 RemoveDcOffset=0 StereoIndependent=0")
                (setf count (1+ count)))))))

      ;; Return result message
      (format nil "Normalized ~A labeled region(s) to -1 dB." count))))
