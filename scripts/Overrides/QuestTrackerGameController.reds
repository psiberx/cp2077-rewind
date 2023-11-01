@addMethod(QuestTrackerGameController)
private func UpdateQuestTrackerVisibility() {
    this.GetRootWidget().SetVisible(true);

    let questTracker = this.GetRootCompoundWidget().GetWidgetByPathName(n"inkVerticalPanelWidget2/QuestTracker");
    questTracker.SetVisible(NotEquals(inkTextRef.GetText(this.m_QuestTitle), ""));
    questTracker.SetAffectsLayoutWhenHidden(true);
}

@wrapMethod(QuestTrackerGameController)
private final func UpdateTrackerData() {
    wrappedMethod();

    this.UpdateQuestTrackerVisibility();
}

@wrapMethod(QuestTrackerGameController)
protected cb func OnTrackedMappinUpdated(value: Variant) -> Bool {
    wrappedMethod(value);

    this.UpdateQuestTrackerVisibility();
}
